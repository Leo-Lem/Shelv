// Created by Leopold Lemmermann on 11.09.23.

import Dependencies
import Model
import SwiftUI

struct CoverView: View {
  let image: Image

  var body: some View {
    VStack {
      Spacer()

      image
        .resizable()
        .scaledToFit()

      Spacer()
    }
    .aspectRatio(3 / 4, contentMode: .fit)
    .background(.ultraThinMaterial)
    .clipShape(.rect(cornerRadius: 10))
  }

  init(_ image: Image) {
    self.image = image
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("No book") {
    CoverView(Book?.none.coverImage)
      .padding()
  }

  #Preview("No book (small)") {
    CoverView(Book?.none.coverImage)
      .frame(maxHeight: 60)
      .padding()
  }

  #Preview("No cover") {
    @Dependency(\.container.mainContext) var context

    return CoverView(Book(isbn: "123", in: context).coverImage)
      .padding()
  }
#endif
