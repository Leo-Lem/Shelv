import Dependencies
import XCTest
@testable import Model

@MainActor
final class ModelTests: XCTestCase {
  func testMockContainer_whenInsertingBook_thenIsInserted() throws {
    @Dependency(\.container) var container

    let book = Book(
      isbn: 123,
      title: "Hello, world!",
      brief: "This book is about taking your first steps in the Swift programming language.",
      totalPages: 99
    )

    container.mainContext.insert(book)

    print(book.isbn)
  }
}
