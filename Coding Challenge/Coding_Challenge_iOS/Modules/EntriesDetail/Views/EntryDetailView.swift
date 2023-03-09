//
//  EntryDetailView.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import SwiftUI

struct EntryDetailView: View {
    let entry: Entry
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 10) {
                    priorityImage(for: entry.priority)
                    Text(entry.title)
                        .font(.title)
                }
                Text(entry.content)
                Spacer()
            }
        }
        .padding(.top,40)
        .padding(.leading,20)
        .padding(.trailing,20)
        .navigationTitle(entry.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func priorityImage(for priority: Priority) -> some View {
        switch priority {
        case .low:
            return Image(systemName: "arrow.down.right.circle.fill")
        case .medium:
            return Image(systemName: "arrow.right.circle.fill")
        case .high:
            return Image(systemName: "arrow.up.right.circle.fill")
        }
    }
}
