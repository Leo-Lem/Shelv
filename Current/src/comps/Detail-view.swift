// Created by Leopold Lemmermann on 11.09.23.

import ComposableArchitecture
import Model
import SwiftUI

struct DetailView: View {
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

  init(
    _ book: Book,
    turnTo: @escaping (Int) -> Void
  ) {
    self.book = book
    self.turnTo = turnTo
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("Sheet") {
    @Dependency(\.container.mainContext) var context

    return Color.clear
      .sheet(isPresented: .constant(true)) {
        DetailView(
          Book(isbn: 123, in: context)
        ) { print("turned to \($0)") }
      }
  }

  #Preview("Raw") {
    @Dependency(\.container.mainContext) var context

    return DetailView(
      Book(isbn: 123, in: context)
    ) { print("turned to \($0)") }
  }
#endif
