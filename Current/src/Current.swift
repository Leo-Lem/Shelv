// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture

public struct Current: ReducerProtocol {
  public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
    // TODO: add reducer for Current

    switch action {
    default: break
    }

    return .none
  }

  public init() {}
}

// MARK: - (STATE)

public extension Current {
  struct State: Equatable {
    // TODO: add state for Current

    public init() {}
  }
}

// MARK: - (ACTIONS)

public extension Current {
  enum Action {
    // TODO: add actions for Current
  }
}
