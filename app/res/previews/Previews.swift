// Created by Leopold Lemmermann on 11.09.23.

import Dependencies
import SwiftData

public extension ModelContainer {
  // swiftlint:disable:next force_try
  static let previewValue = try! ModelContainer(
    for: Book.self,
    configurations: ModelConfiguration(isStoredInMemoryOnly: true)
  )
}

extension ModelContext {
  static let preview = Dependency(\.modelContainer.mainContext).wrappedValue
}
