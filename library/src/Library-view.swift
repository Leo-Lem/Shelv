// Created by Leopold Lemmermann on 13.09.23.

import ComposableArchitecture
import SwiftUI

public struct LibraryView: View {
  @Environment(\.libraryStore) var store

  public var body: some View {
    WithViewStore(store) { vs in
      Render() // TODO: configure
    }
  }
}

// MARK: - (RENDER)

extension LibraryView {
  struct Render: View {
    var body: some View {
      Text("Your library") // TODO: implement render view
    }
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
#Preview {
  LibraryView.Render()
}
#endif
