// Created by Leopold Lemmermann on 13.09.23.

import ComposableArchitecture
import struct Foundation.UUID
import SwiftData
import SwiftUI

struct Library: Reducer {
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case .load:
      do {
        state.books = try context.fetch(
          FetchDescriptor<Book>(sortBy: [.init(\.title)])
        )
      } catch {
        assert(true, "Failed to fetch library.")
      }

    case let .add(book):
      context.insert(book)
      context.saveChanges()

      return .send(.load)

    case let .edit(isbn, update):
      do {
        guard var book = try context.fetch(
          .init(predicate: #Predicate<Book> { $0.isbn == isbn }), batchSize: 1
        ).first else { break }

        update(&book)
        context.saveChanges()

        return .send(.load)
      } catch {
        assert(true, "Failed to fetch book with ISBN \(isbn).")
      }

    default: break
    }

    return .none
  }

  @Dependency(\.modelContainer.mainContext) private var context
}

// MARK: - (STATE)

extension Library {
  struct State: Equatable {
    var books = [Book]()
  }
}

// MARK: - (ACTIONS)

extension Library {
  enum Action {
    case load
    case add(Book)
    case edit(_ isbn: String, update: (inout Book) -> Void)
    case remove(_ isbn: String)
  }
}

// MARK: - (ENVIRONMENT)

extension Library: EnvironmentKey {
  static var defaultValue = StoreOf<Library>(initialState: .init()) {}
}

extension EnvironmentValues {
  var libraryStore: StoreOf<Library> {
    get { self[Library.self] }
    set { self[Library.self] = newValue }
  }
}
