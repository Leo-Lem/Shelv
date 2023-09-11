import Dependencies
@testable import Model
import SwiftData
import XCTest

@MainActor
final class ModelTests: XCTestCase {
  var context: ModelContext!

  override func setUp() async throws {
    let container = try ModelContainer(for: Book.self, ModelConfiguration(inMemory: true))
    context = container.mainContext
  }

  override func tearDown() async throws {
    context.container.destroy()
  }

  func testTurningPage_whenTurningToInvalidPage_thenTurnsToValidPage() throws {
    let total = 100
    let book = Book(isbn: "123", totalPages: total)
    context.insert(book)

    for (invalid, valid) in [
      (-1, 1),
      (0, 1),
      (total + 1, total),
      (.max, total), (.min, 1)
    ] {
      book.turn(to: invalid)
      XCTAssertEqual(book.currentPage, valid)
    }
  }
}
