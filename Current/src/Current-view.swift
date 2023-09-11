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
        CoverView(book.coverImage)
          .frame(maxHeight: 60)
          .padding(5)

        VStack {
          HStack {
            Text(book.titleString)
              .font(.headline)

            if let author = book?.authorString {
              Text("BY \(author)", bundle: .module)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
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
      .background(.bar)
      .animation(.default, value: detailing)
      .sheet(isPresented: $detailing) {
        if let book { DetailView(book, turnTo: turnTo) }
      }
      .onTapGesture {
        if book != nil { detailing = true }
      }
    }

    @State private var detailing = false

    init(book: Book?, turnTo: @escaping (Int) -> Void) {
      self.book = book
      self.turnTo = turnTo
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("Example") {
    Color.clear
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea()
      .overlay(alignment: .bottom) {
        CurrentView.Render(
          book: Book(isbn: "123", totalPages: 100, in: .preview)
        ) { print("turned to \($0)") }
      }
  }

  #Preview("None") {
    Color.clear
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .ignoresSafeArea()
      .overlay(alignment: .bottom) {
        CurrentView.Render(book: nil) { print("turned to \($0)") }
      }
  }
#endif
