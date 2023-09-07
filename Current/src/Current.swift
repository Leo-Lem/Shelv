// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import class Model.Book

// TODO: add a macro for creating reducers. lots of boilerplate here.

public struct Current: Reducer {
  public func reduce(into state: inout State, action: Action) -> Effect<Action> {
    switch action {
    case let .read(book):
      state.current = book

    case let .turnTo(page):
      state.current?.currentPage = page
    }

    return .none
  }

  public init() {}
}

// MARK: - (STATE)

public extension Current {
  struct State: Equatable {
    public var current: Book?

    public init(current: Book? = nil) {
      self.current = current
    }
  }
}

// MARK: - (ACTIONS)

public extension Current {
  enum Action {
    case read(_ book: Book?)
    case turnTo(_ page: Int)
  }
}

// MARK: - (ENVIRONMENT)

import protocol SwiftUI.EnvironmentKey
import struct SwiftUI.EnvironmentValues

extension Current: EnvironmentKey {
  public static var defaultValue = StoreOf<Current>(initialState: .init()) {}
}

public extension EnvironmentValues {
  var currentStore: StoreOf<Current> {
    get { self[Current.self] }
    set { self[Current.self] = newValue }
  }
}
