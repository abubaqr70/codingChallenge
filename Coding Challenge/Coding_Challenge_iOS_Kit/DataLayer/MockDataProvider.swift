//
//  MockDataProvider.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

protocol MockEntryDataProviderProtocool {
    func provideMockEntries() -> [Entry]
}

class MockEntryDataProvider: MockEntryDataProviderProtocool {
    func provideMockEntries() -> [Entry] {
        let entry1 = Entry(id: UUID(), title: "Buy Groceries", content: "Milk, eggs, bread, cheese", priority: .medium)
        let entry2 = Entry(id: UUID(), title: "Call Mom", content: "Ask about her trip", priority: .high)
        let entry3 = Entry(id: UUID(), title: "Finish Project", content: "Wrap up loose ends and submit by Friday", priority: .high)
        let entry4 = Entry(id: UUID(), title: "Go for a run", content: "Around the park at 6pm", priority: .low)
        let entry5 = Entry(id: UUID(), title: "Read Book", content: "Chapter 3 of 'The Alchemist'", priority: .medium)
        return [entry1, entry2, entry3, entry4, entry5]
    }
}
