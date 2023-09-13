// Created by Leopold Lemmermann on 05.09.23.

import struct Foundation.UUID
import SwiftData

@Model
public class Author {
  @Attribute(.unique) public let id: UUID

  public var name: String
  public var brief: String? = nil
  @Relationship(deleteRule: .cascade) public var books: [Book] = []

  public init(
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
    public convenience init(
      name: String,
      brief: String? = nil,
      books: [Book],
      in _: ModelContext
    ) {
      self.init(name: name, brief: brief, books: books)
    }
  #endif
}
