// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import struct Current.Current

struct AppReducer: ReducerProtocol {
  var body: some ReducerProtocol<State, Action> {
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
