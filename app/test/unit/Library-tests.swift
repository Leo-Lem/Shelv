// Created by Leopold Lemmermann on 13.09.23.

@testable import Shelf
import ComposableArchitecture
import SwiftData
import XCTest

@MainActor
final class LibraryTests: XCTestCase {
  var context: ModelContext!

  override func setUp() async throws {
    let container = try ModelContainer(
      for: Book.self,
      configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )
    context = container.mainContext
  }

  override func tearDown() async throws {
    context.container.deleteAllData()
  }

  func testLoading_givenLibraryHasBooks_whenLoading_thenAreLoaded() async throws {
    let book = Book(isbn: "123")
    context.insert(book)

    let store = TestStore(initialState: .init(), reducer: Library.init){
      $0.modelContainer = context.container
    }

    await store.send(.load) { $0.books = [book] }
  }

  func testAdding_whenAddingBook_thenIsAddedToState() async throws {
    
  }
}
