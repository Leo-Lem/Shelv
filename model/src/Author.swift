// Created by Leopold Lemmermann on 05.09.23.

import struct Foundation.UUID
import SwiftData

@Model
public class Author {
  @Attribute(.unique) public let id: UUID
  public let name: String
  public let brief: String? = nil

  @Relationship(.cascade) public var books: [Book] = []

  public init(
    name: String, brief: String? = nil, books: [Book],
    in _: ModelContext? = nil
  ) {
    id = UUID()
    self.name = name
    self.brief = brief
    self.books = books
  }
}
