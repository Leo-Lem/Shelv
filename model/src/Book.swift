// Created by Leopold Lemmermann on 05.09.23.

import struct Foundation.Data
import SwiftData

@Model
public class Book {
  @Attribute(.unique) public let isbn: Int

  public var title: String? = nil
  public var brief: String? = nil
  public var totalPages: Int? = nil

  public var cover: Data?

  public var currentPage: Int?

  public var author: Author?

  public init(
    isbn: Int, title: String? = nil, brief: String? = nil, totalPages: Int? = nil, author: Author? = nil,
    in _: ModelContext? = nil
  ) {
    self.isbn = isbn
    self.title = title
    self.brief = brief
    self.totalPages = totalPages
    self.author = author
  }
}
