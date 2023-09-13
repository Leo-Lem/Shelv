// Created by Leopold Lemmermann on 13.09.23.

import ComposableArchitecture
import struct Foundation.UUID
import SwiftData

public struct Library: Reducer {
  public func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case let .add(book):
      
    case let .edit(id, update):

    default: break
    }

    return .none
  }

  @Dependency(\.container.mainContext) private var context
}

// MARK: - (STATE)

public extension Library {
  struct State: Equatable {
    var books = [Book]()
  }
}

// MARK: - (ACTIONS)

public extension Library {
  enum Action {
    case add(Book)
    case edit(_ id: UUID, update: (inout Book) -> Void)
    case remove(Book)
  }
}

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension Library: EnvironmentKey {
  public static var defaultValue = StoreOf<Library>(initialState: .init()) {}
}

public extension EnvironmentValues {
  var libraryStore: StoreOf<Library> {
    get { self[Library.self] }
    set { self[Library.self] = newValue }
  }
}
