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
        (book?.coverImage ?? Image("Placeholder"))
          .resizable()
          .background(.ultraThickMaterial)
          .clipShape(.rect(cornerRadius: 5))
          .aspectRatio(1, contentMode: .fit)
          .padding(5)

        VStack {
          HStack {
            Text(book?.defaultedTitle ?? "NO_BOOK")
              .font(.headline)

            Text("Author")
              .font(.subheadline)
              .foregroundStyle(.gray)
          }

          Slider(value: $selectedPage, in: 1 ... Double(book?.totalPages ?? 2), step: 1)
            .onChange(of: selectedPage) { _, newValue in turnTo(Int(newValue)) }
            .padding(.top, -20)
            .disabled(book == nil)
        }
        .frame(maxWidth: .infinity)

        Button { selectedPage += 1 } label: {
          Label("NEXT_PAGE", systemImage: "chevron.forward")
        }
        .buttonStyle(.borderedProminent)
        .disabled(book == nil)
      }
      .padding(.trailing)
      .frame(maxWidth: .infinity, maxHeight: 60) // TODO: adjust this to different displays
      .labelStyle(.iconOnly)
      .background(.regularMaterial)
    }

    @State private var selectedPage: Double

    init(book: Book?, turnTo: @escaping (Int) -> Void) {
      self.book = book
      self.turnTo = turnTo
      selectedPage = Double(book?.currentPage ?? 1)
    }
  }
}

public extension Book {
  var defaultedTitle: String { title ?? "New Book" }

  var coverImage: Image? {
    cover
      .flatMap(UIImage.init)
      .flatMap(Image.init)
  }
}

// MARK: - (PREVIEWS)

#Preview {
  @Dependency(\.container.mainContext) var context

  return Color.accentColor
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .ignoresSafeArea()
    .overlay(alignment: .bottom) {
      CurrentView.Render(
        book: Book(isbn: 123, title: "Hello, world!", totalPages: 100, in: context)
      ) { print("turned to \($0)") }
    }
}
