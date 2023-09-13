// Created by Leopold Lemmermann on 13.09.23.

import Dependencies
import SwiftData

extension ModelContainer: DependencyKey {
  public static let liveValue = {
    do { return try ModelContainer(for: Book.self) } catch {
      fatalError("Failed to create model container.")
    }
  }()
}

extension DependencyValues {
  var modelContainer: ModelContainer {
    get { self[ModelContainer.self] }
    set { self[ModelContainer.self] = newValue }
  }
}

extension ModelContext {
  func saveChanges() {
    do {
      if hasChanges { 
        try save()
      }
    } catch {
      assert(true, "Failed to save ModelContext.")
    }
  }
}
