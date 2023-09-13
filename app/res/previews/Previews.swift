// Created by Leopold Lemmermann on 11.09.23.

import class Model.Book
import SwiftData

@MainActor
extension ModelContext {
  // swiftlint:disable:next force_try
  static let preview = try! ModelContainer(
    for: Book.self,
    configurations: ModelConfiguration(isStoredInMemoryOnly: true)
  ).mainContext
}
