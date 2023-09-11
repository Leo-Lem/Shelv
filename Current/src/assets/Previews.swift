// Created by Leopold Lemmermann on 11.09.23.

#if DEBUG
  import class Model.Book
  import SwiftData

  @MainActor
  extension ModelContext {
    static let preview = try! ModelContainer(
      for: [Book.self],
      ModelConfiguration(inMemory: true)
    ).mainContext
  }
#endif
