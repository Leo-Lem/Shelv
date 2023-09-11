// Created by Leopold Lemmermann on 11.09.23.

import class Model.Book

extension Optional<Book> {
  var author: String? {
    if let self {
      if let author = self.author {
        return author.name
      } else {
        return String(localized: "UNKNOWN_AUTHOR", bundle: .module)
      }
    } else {
      return nil
    }
  }
}
