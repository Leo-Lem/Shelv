// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import SwiftUI
import struct Current.CurrentView

struct AppView: View {
  @EnvironmentObject private var store: StoreOf<AppReducer>

  var body: some View {
    WithViewStore(store) { vs in
      Render()
        .environmentObject(store.scope(state: \.current, action: { .current($0) }))
    }
  }
}

// MARK: - (RENDER)

extension AppView {
  struct Render: View {
    var body: some View {
      CurrentView()
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
