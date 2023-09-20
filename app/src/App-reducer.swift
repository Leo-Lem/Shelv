// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture

struct AppReducer: Reducer {
  var body: some Reducer<State, Action> {
    Scope(state: \.current, action: /Action.current, child: Current.init)

    Reduce { state, action in
      switch action {
      // TODO: add reducers
      default: break
      }

      return .none
    }
  }
}

// MARK: - (STATE)

extension AppReducer {
  struct State: Equatable {
    var current = Current.State()
    // TODO: add state
  }
}

// MARK: - (ACTIONS)

extension AppReducer {
  enum Action {
    case current(Current.Action)
    // TODO: add actions
  }
}

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension AppReducer: EnvironmentKey {
  static public var defaultValue = StoreOf<AppReducer>(initialState: .init()) {}
}

extension EnvironmentValues {
  var store: StoreOf<AppReducer> {
    get { self[AppReducer.self] }
    set { self[AppReducer.self] = newValue }
  }
}
