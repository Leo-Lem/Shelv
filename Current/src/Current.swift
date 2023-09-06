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

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension Current: EnvironmentKey {
  static public var defaultValue = StoreOf<Current>(initialState: .init()) {}
}

extension EnvironmentValues {
  var currentStore: StoreOf<Current> {
    get { self[Current.self] }
    set { self[Current.self] = newValue }
  }
}
