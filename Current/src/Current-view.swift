// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import Model
import SwiftData
import SwiftUI

public struct CurrentView: View {
  @Environment(\.currentStore) var store

  public var body: some View {
    WithViewStore(store, observe: \.current) { book in
      Render(book: book.state) { book.send(.turnTo($0)) }
    }
  }

  public init() {}
}

// MARK: - (RENDER)

extension CurrentView {
  struct Render: View {
    let book: Book?
    let turnTo: (_ page: Int) -> Void

    var body: some View {
      HStack {
        CoverView(book?.cover)
          .frame(maxHeight: 60)
          .padding(5)

        VStack {
          HStack {
            Text(title)
              .font(.headline)

            Text("Author") // TODO: implement authors
              .font(.subheadline)
              .foregroundStyle(.gray)
          }

          ProgressControl(
            page: Binding { book?.currentPage ?? 1 } set: { turnTo($0) },
            total: book?.totalPages ?? 2
          )
          .padding(.top, -10)
          .disabled(book == nil)
        }
      }
      .padding(.trailing)
      .frame(maxWidth: .infinity)
      .background(.regularMaterial)
    }

    private var title: String {
      if let book {
        if let title = book.title {
          return title
        } else {
          return "NEW_BOOK"
        }
      } else {
        return "NO_BOOK"
      }
    }

    init(book: Book?, turnTo: @escaping (Int) -> Void) {
      self.book = book
      self.turnTo = turnTo
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview {
    @Dependency(\.container.mainContext) var context

    return Color.primary
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea()
      .overlay(alignment: .bottom) {
        CurrentView.Render(
          book: Book(isbn: 123, title: "Hello, world!", totalPages: 100, in: context)
        ) { print("turned to \($0)") }
      }
  }
#endif
