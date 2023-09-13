// Created by Leopold Lemmermann on 13.09.23.

import ComposableArchitecture

public struct Library: Reducer {
  public func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
      // TODO: add reducers
    default: break
    }

    return .none
  }
}

// MARK: - (STATE)

extension Library {
  public struct State: Equatable {
    // TODO: add state
  }
}

// MARK: - (ACTIONS)

extension Library {
  public enum Action {
    // TODO: add actions
  }
}

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension Library: EnvironmentKey {
  public static var defaultValue = StoreOf<Library>(initialState: .init()) {}
}

public extension EnvironmentValues {
  var libraryStore: StoreOf<Library> {
    get { self[Library.self] }
    set { self[Library.self] = newValue }
  }
}
