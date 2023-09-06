// Created by Leopold Lemmermann on 05.09.23.

import SwiftData

@Model
public class Book {
  @Attribute(.unique) public let isbn: Int
  public let title: String
  public let brief: String
  public let author: Author

  public init(isbn: Int, title: String, brief: String, author: Author) {
    self.isbn = isbn
    self.title = title
    self.brief = brief
    self.author = author
  }
}
