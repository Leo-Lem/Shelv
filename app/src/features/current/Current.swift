// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture

// TODO: add a macro for creating reducers.

struct Current: Reducer {
  func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case let .read(book):
      state.current = book

    case let .turnTo(page):
      state.current?.turn(to: page)
    }

    return .none
  }
}

// MARK: - (STATE)

extension Current {
  struct State: Equatable {
    var current: Book?

    init(current: Book? = nil) {
      self.current = current
    }
  }
}

// MARK: - (ACTIONS)

extension Current {
  enum Action {
    case read(_ book: Book?)
    case turnTo(_ page: Int)
  }
}

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension Current: EnvironmentKey {
  static var defaultValue = StoreOf<Current>(initialState: .init()) {}
}

extension EnvironmentValues {
  var currentStore: StoreOf<Current> {
    get { self[Current.self] }
    set { self[Current.self] = newValue }
  }
}
