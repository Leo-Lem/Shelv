// Created by Leopold Lemmermann on 05.09.23.

import SwiftData
import struct Foundation.UUID

@Model
class Author {
  let id: UUID
  let name: String
  let brief: String

  var books: [Book] = [] // TODO: possibly cascade

  init(name: String, brief: String, books: [Book]) {
    id = UUID()
    self.name = name
    self.brief = brief
    self.books = books
  }
}
