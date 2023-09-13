// Created by Leopold Lemmermann on 11.09.23.

import SwiftUI

// TODO: add a page number

struct ProgressControl: View {
  @Binding var page: Int
  let total: Int

  var body: some View {
    HStack {
      Button {
        page -= 1
      } label: {
        Label("PREVIOUS_PAGE", systemImage: "chevron.backward")
      }
      .disabled(page < 2)

      Slider(
        value: Binding { Double(page) } set: { page = Int($0) },
        in: 1 ... Double(total),
        step: 1
      ) {} minimumValueLabel: {
        Text(page.formatted())
      } maximumValueLabel: {
        Text((page - (1 + total)).formatted())
      }
      .font(.headline)
      .foregroundStyle(.secondary)

      Button {
        page += 1
      } label: {
        Label("NEXT_PAGE", systemImage: "chevron.forward")
      }
      .disabled(page > total - 1)
    }
    .labelStyle(.iconOnly)
  }
}

// MARK: - (PREVIEWS)

#if DEBUG
  #Preview("First") {
    ProgressControl(
      page: .constant(1),
      total: 100
    )
    .padding()
  }

  #Preview("Some") {
    ProgressControl(
      page: .constant(56),
      total: 100
    )
    .padding()
  }

  #Preview("Last") {
    ProgressControl(
      page: .constant(100),
      total: 100
    )
    .padding()
  }

  #Preview("Disabled") {
    ProgressControl(
      page: .constant(56),
      total: 100
    )
    .disabled(true)
    .padding()
  }
#endif
