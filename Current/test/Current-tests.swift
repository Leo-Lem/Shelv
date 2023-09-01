// Created by Leopold Lemmermann on 01.09.2023.

@testable import Current
import ComposableArchitecture
import XCTest

@MainActor
final class CurrentTests: XCTestCase {
  // TODO: Add unit tests for Current

  func test<#Feature#>_given<#Precondition#>_when<#Action#>_then<#Outcome#>() async throws {
    <#Given#>

    let store = TestStore(initialState: <#State#>, reducer: Current()) {
      <#Dependencies#>
    }

    await store.send(<#Action#>) { <#New State#> }
    await store.receive(<#Action#>) { <#New State#> }
  }
}
