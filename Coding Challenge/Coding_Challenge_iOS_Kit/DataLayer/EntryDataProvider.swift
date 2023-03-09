//
//  EntryDataProvider.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

protocol EntryDataProviderProtocol {
    func fetchEntries(priorityLevel: Priority, completion: @escaping (Result<[Entry], Error>) -> Void)
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void)
}

class EntryDataProvider: EntryDataProviderProtocol {
    
    private let entryService: EntryServiceProtocol
    
    init(entryService: EntryServiceProtocol) {
        self.entryService = entryService
    }
    
    func fetchEntries(priorityLevel: Priority, completion: @escaping (Result<[Entry], Error>) -> Void) {
        entryService.fetchEntries { result in
            switch result {
            case .success(let entries):
                let filteredEntries = entries.filter { $0.priority.rawValue >= priorityLevel.rawValue }
                completion(.success(filteredEntries))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {
        entryService.fetchEntry(withID: id, completion: completion)
    }
}
