// Created by Leopold Lemmermann on 11.09.23.

import SwiftUI

struct CoverView: View {
  let image: Image?

  var body: some View {
    (image ?? Image("no-cover", bundle: .module))
      .resizable()
      .scaledToFit()
      .background(.regularMaterial)
      .clipShape(.rect(cornerRadius: 10))
  }

  init(image: Image?) {
    self.image = image
  }

  init(_ data: Data?) {
    image = data
      .flatMap(UIImage.init)
      .flatMap(Image.init)
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("Small") {
    CoverView(nil)
      .frame(height: 60)
      .padding()
  }

  #Preview("Large") {
    CoverView(nil)
      .padding()
  }
#endif
