// Created by Leopold Lemmermann on 05.09.23.

import struct Foundation.Data
import SwiftData

@Model
public class Book {
  @Attribute(.unique) public let isbn: String

  public var title: String?
  public var brief: String?
  public var totalPages: Int?
  public var cover: Data?
  @Relationship public var author: Author?

  public var currentPage: Int?

  public init(
    isbn: String,
    title: String? = nil,
    brief: String? = nil,
    totalPages: Int? = nil,
    author: Author? = nil
  ) {
    self.isbn = isbn
    self.title = title
    self.brief = brief
    self.totalPages = totalPages
    self.author = author
  }

  // TODO: build macro for this
  #if DEBUG
    public convenience init(
      isbn: String,
      title: String? = nil,
      brief: String? = nil,
      totalPages: Int? = nil,
      author: Author? = nil,
      in _: ModelContext
    ) {
      self.init(isbn: isbn, title: title, brief: brief, totalPages: totalPages, author: author)
    }
  #endif
}

public extension Book {
  func turn(to page: Int) {
    if page < 1 {
      currentPage = 1
    } else if let totalPages, page > totalPages {
      currentPage = totalPages
    } else {
      currentPage = page
    }

    if page > 1, page < totalPages ?? .max {
      print("page out of bounds")
    }
  }
}
