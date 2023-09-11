// Created by Leopold Lemmermann on 11.09.23.

import class Model.Book

extension Optional<Book> {
  var title: String {
    if let self {
      if let title = self.title {
        return title
      } else {
        return String(localized: "NEW_BOOK", bundle: .module)
      }
    } else {
      return String(localized: "NO_BOOK", bundle: .module)
    }
  }
}
