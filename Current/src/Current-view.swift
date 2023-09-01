// Created by Leopold Lemmermann on 01.09.2023.

import ComposableArchitecture
import SwiftUI

public struct CurrentView: View {
  @EnvironmentObject var store: StoreOf<Current>

  public var body: some View {
    WithViewStore(store) { vs in
      // TODO: configure Current view
      Render()
    }
  }

  public init() {}
}

extension Store: ObservableObject {} // pass store as environment object

// MARK: - (RENDER)

extension CurrentView {
  struct Render: View {
    var body: some View {
      Text("Current") // TODO: implement Current render view
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  struct CurrentView_Previews: PreviewProvider {
    static var previews: some View {
      CurrentView.Render()
    }
  }
#endif
