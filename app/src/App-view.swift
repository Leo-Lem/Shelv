// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import SwiftUI
import struct Current.CurrentView

struct AppView: View {
  @Environment(\.store) private var store

  var body: some View {
    WithViewStore(store, observe: \.current) { vs in
      Render()
        .environment(\.currentStore, store.scope(state: \.current, action: { .current($0) }))
    }
  }
}

// MARK: - (RENDER)

extension AppView {
  struct Render: View {
    var body: some View {
      NavigationStack {
        Text("LIBRARY")
      }
      .overlay(alignment: .bottom, content: CurrentView.init)
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  struct AppView_Previews: PreviewProvider {
    static var previews: some View {
      AppView.Render()
    }
  }
#endif
