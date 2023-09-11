// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
@testable import Current
import class Model.Book
import SwiftData
import XCTest

@MainActor
final class CurrentTests: XCTestCase {
  // TODO: macro?
  var context: ModelContext!

  override func setUp() async throws {
    let container = try ModelContainer(for: Book.self, ModelConfiguration(inMemory: true))
    context = container.mainContext
  }

  override func tearDown() async throws {
    context.container.destroy()
  }

  func testReadingNewBook_givenNoCurrentBook_whenReadingBook_thenBecomesCurrent() async throws {
    let store = TestStore(
      initialState: .init(current: nil),
      reducer: Current.init
    )

    let book = Book(isbn: "123")
    context.insert(book)

    await store.send(.read(book)) { $0.current = book }
  }

  func testDismissingCurrentBook_givenCurrentBook_whenDismissing_thenNoCurrentBook() async throws {
    let book = Book(isbn: "123")
    context.insert(book)

    let store = TestStore(
      initialState: .init(current: book),
      reducer: Current.init
    )

    await store.send(.read(nil)) { $0.current = nil }
  }

  func testTurningPage_givenCurrentBook_whenTurningPage_thenTurnsPage() async throws {
    let book = Book(isbn: "123", totalPages: 100)
    context.insert(book)

    let store = TestStore(
      initialState: .init(current: book),
      reducer: Current.init
    )

    let page = 10

    await store.send(.turnTo(page))

    XCTAssertEqual(store.state.current?.currentPage, page)
  }
}
