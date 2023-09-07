// Created by Leopold Lemmermann on 07.09.23.

import SwiftData
import Dependencies

// TODO: macro potential (@DependencyKey)
extension ModelContainer: DependencyKey {
  public static let liveValue = try! ModelContainer(for: Book.self)
  public static let previewValue = try! ModelContainer(for: Book.self, ModelConfiguration(inMemory: true))
}

public extension DependencyValues {
  var container: ModelContainer {
    get { self[ModelContainer.self] }
    set { self[ModelContainer.self] = newValue }
  }
}
