//
//  EntriesListView.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import SwiftUI

struct EntriesView: View {
    @ObservedObject var viewModel: EntriesViewModel

    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                } else if let error = viewModel.error {
                    Text(error.localizedDescription)
                } else {
                    EntriesListView(entries: viewModel.entries)
                }
            }
            .onAppear {
                viewModel.fetchEntries()
            }
            .navigationTitle("Entries")
        }
    }
}

struct EntriesListView: View {
    let entries: [Entry]
    
    var body: some View {
        List(entries) { entry in
            NavigationLink(
                destination: EntryDetailView(entry: entry),
                label: {
                    EntryRowView(entry: entry)
                }
            )
        }
    }
}



struct EntryRowView: View {
    let entry: Entry
    
    var body: some View {
        HStack {
            priorityImage(for: entry.priority)
            Text(entry.title)
        }
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


struct EntriesListView_Previews: PreviewProvider {
    static var previews: some View {
        let dataProvider = MockEntryDataProvider()
        let mockData = dataProvider.provideMockEntries()
        EntriesListView(entries: mockData)
    }
}
