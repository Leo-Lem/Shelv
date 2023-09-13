// Created by Leopold Lemmermann on 01.09.2023.

import class ComposableArchitecture.Store
import SwiftData
import SwiftUI

@main
struct App: SwiftUI.App {
  var body: some Scene {
    WindowGroup {
      AppView()
        .environment(\.store, store)
    }
  }

  private let store = Store(initialState: .init(), reducer: AppReducer.init)
}
