// Created by Leopold Lemmermann on 13.09.23.

@testable import Shelf
import XCTest
import SwiftData
import XCTest

@MainActor
final class LibraryTests: XCTestCase {
  var context: ModelContext! // TODO: macro?

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

  // TODO: add tests
}
