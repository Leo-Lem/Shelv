// Created by Leopold Lemmermann on 11.09.23.

import class Model.Book
import SwiftUI

extension Book {
  var coverImage: Image {
    if let image = self.cover
      .flatMap(UIImage.init)
      .flatMap(Image.init)
    {
      return image
    } else {
      return Image("no-cover")
    }
  }
}

extension Book? {
  var coverImage: Image {
    if let self {
      return self.coverImage
    } else {
      return Image(systemName: "book")
    }
  }
}
