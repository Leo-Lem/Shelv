// Created by Leopold Lemmermann on 01.09.2023.

import XCTest

@MainActor
final class ShelfUITests: XCTestCase {
  private var app: XCUIApplication!

  override func setUp() {
    continueAfterFailure = false

    app = XCUIApplication()
    app.launch()
  }

  override func tearDown() {
    app.terminate()
    app = nil
  }

  func testLaunchPerformance() throws {
    measure(metrics: [XCTApplicationLaunchMetric()]) {
      XCUIApplication().launch()
    }
  }

  func test<#Feature#>_given<#Precondition#>_when<#Action#>_then<#Outcome#>() throws {
    // TODO: Add UI tests for Shelf
  }
}
