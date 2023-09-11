// Created by Leopold Lemmermann on 11.09.23.

import ComposableArchitecture
import Model
import SwiftUI

struct CurrentDetailView: View {
  @Environment(\.currentStore) var store
  @Environment(\.dismiss) var dismiss

  var body: some View {
    WithViewStore(store, observe: \.current) { book in
      if let currentBook = book.state {
        Render(book: currentBook) { book.send(.turnTo($0)) }
      } else {
        EmptyView()
          .onAppear(perform: dismiss.callAsFunction)
      }
    }
  }
}

// MARK: - (RENDER)

extension CurrentDetailView {
  struct Render: View {
    let book: Book
    let turnTo: (Int) -> Void

    var body: some View {
      VStack {
        CoverView(book.coverImage)
          .padding()

        Text(book.titleString)

        Text("BY \(book.authorString)", bundle: .module)
          .foregroundStyle(.secondary)

        ProgressControl(
          page: Binding { book.currentPage ?? 1 } set: { turnTo($0) },
          total: book.totalPages ?? 2
        )
      }
      .padding()
      .presentationBackground(.bar)
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("Sheet") {
    @Dependency(\.container.mainContext) var context

    return Color.clear
      .sheet(isPresented: .constant(true)) {
        CurrentDetailView.Render(
          book: Book(isbn: 123, in: context)
        ) { print("turned to \($0)") }
      }
  }

  #Preview("Raw") {
    @Dependency(\.container.mainContext) var context

    return CurrentDetailView.Render(
      book: Book(isbn: 123, in: context)
    ) { print("turned to \($0)") }
  }
#endif
