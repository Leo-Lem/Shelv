// Created by Leopold Lemmermann on 01.09.2023.

@testable import Shelf
import XCTest

@MainActor
final class ShelfTests: XCTestCase {
  func test<#Feature#>_given<#Precondition#>_when<#Action#>_then<#Outcome#>() async throws {
    <#Given#>

    let store = TestStore(initialState: <#State#>, reducer: <#Reducer#>()) {
      <#Dependencies#>
    }

    await store.send(<#Action#>) { <#New State#> }
    await store.receive(<#Action#>) { <#New State#> }
  }
}
