// Created by Leopold Lemmermann on 05.09.23.

import Foundation
import SwiftData

@Model
class Book {
  @Attribute(.unique) let isbn: String

  var title: String?
  var brief: String?
  var totalPages: Int?
  var cover: Data?
  @Relationship var author: Author?

  var currentPage: Int?

  init(
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

  #if DEBUG
    convenience init(
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

extension Book {
  func turn(to page: Int) {
    if page < 1 {
      currentPage = 1
    } else if let totalPages, page > totalPages {
      currentPage = totalPages
    } else {
      currentPage = page
    }

    #if !TEST
    assert(page > 1 && page < totalPages ?? .max, "page out of bounds")
    #endif
  }
}
