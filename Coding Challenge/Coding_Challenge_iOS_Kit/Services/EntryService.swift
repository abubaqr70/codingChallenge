//
//  EntryService.swift
//  Coding Challenge
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation

protocol EntryServiceProtocol {
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void)
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void)
}

class EntryService: EntryServiceProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void) {
        networkService.fetchEntries { result in
            switch result {
            case .success(let entries):
                completion(.success(entries))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {
        networkService.fetchEntry(withID: id, completion: completion)
    }
}
