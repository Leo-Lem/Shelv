// Created by Leopold Lemmermann on 05.09.23.

import struct Foundation.UUID
import SwiftData

@Model
class Author {
  @Attribute(.unique) let id: UUID

  var name: String
  var brief: String?
  @Relationship(deleteRule: .cascade) var books: [Book] = []

  init(
    name: String,
    brief: String? = nil,
    books: [Book]
  ) {
    id = UUID()
    self.name = name
    self.brief = brief
    self.books = books
  }

  #if DEBUG
    convenience init(
      name: String,
      brief: String? = nil,
      books: [Book],
      in _: ModelContext
    ) {
      self.init(name: name, brief: brief, books: books)
    }
  #endif
}
