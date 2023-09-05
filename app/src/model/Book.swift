// Created by Leopold Lemmermann on 05.09.23.

import SwiftData

@Model
class Book {
  @Attribute(.unique) let isbn: Int
  let title: String
  let brief: String
  let author: Author

  init(isbn: Int, title: String, brief: String, author: Author) {
    self.isbn = isbn
    self.title = title
    self.brief = brief
    self.author = author
  }
}
