// Created by Leopold Lemmermann on 11.09.23.

import class Model.Book

extension Book {
  var titleString: String {
    if let title = self.title {
      return title
    } else {
      return String(localized: "NEW_BOOK", bundle: .module)
    }
  }
}

extension Book? {
  var titleString: String {
    if let self {
      return self.titleString
    } else {
      return String(localized: "NO_BOOK", bundle: .module)
    }
  }
}
