//
//  EntriesListViewModel.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

class EntriesViewModel:ObservableObject {
    
    private let dataLayer: EntryDataProviderProtocol
    
    @Published var entries: [Entry] = []
    @Published var isLoading: Bool = false
    @Published var error: Error?
    
    var priority: Priority
    
    init(dataLayer: EntryDataProviderProtocol, minPriority: Priority) {
        self.dataLayer = dataLayer
        self.priority = minPriority
    }
    
    func fetchEntries() {
        isLoading = true
        dataLayer.fetchEntries(priorityLevel: priority) { [weak self] result in
            guard let self = self else { return }
            
            self.isLoading = false
            
            switch result {
            case .success(let entries):
                let filteredEntries = entries.filter { $0.priority.rawValue >= self.priority.rawValue }
                self.entries.removeAll()
                self.entries.append(contentsOf: filteredEntries)
            case .failure(let error):
                self.error = error
            }
        }
    }
}
