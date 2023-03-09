//
//  EntryDataProviderTests.swift
//  Coding ChallengeTests
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import XCTest
@testable import Coding_Challenge

class EntryDataProviderTests: XCTestCase {
    
    var entryServiceMock: EntryServiceMock!
    var entryDataProvider: EntryDataProvider!
    
    override func setUp() {
        super.setUp()
        
        entryServiceMock = EntryServiceMock()
        entryDataProvider = EntryDataProvider(entryService: entryServiceMock)
    }
    
    
    override func tearDown() {
        entryServiceMock = nil
        entryDataProvider = nil
        super.tearDown()
    }
    
    func testFetchEntriesWithPriority() {
        // Given
        let expectedEntries = [
            Entry(id: UUID(), title: "High Priority Entry", content: "Content", priority: .high),
            Entry(id: UUID(), title: "Medium Priority Entry", content: "Content", priority: .medium),
            Entry(id: UUID(), title: "Another High Priority Entry", content: "Content", priority: .high)
        ]
        entryServiceMock.fetchEntriesCompletionResult = .success([
            Entry(id: UUID(), title: "Low Priority Entry", content: "Content", priority: .low),
            expectedEntries[0],
            expectedEntries[1],
            expectedEntries[2]
        ])
        
        // When
        entryDataProvider.fetchEntries(priorityLevel: .medium) { result in
            switch result {
            case .success(let entries):
                // Then
                XCTAssertEqual(entries.count, expectedEntries.count, "Fetched entries do not match expected entries")
            case .failure(let error):
                XCTFail("Expected successful result, but got error: \(error)")
            }
        }
    }
    
    func testFetchEntry() {
        // Given
        let expectedEntry = Entry(id: UUID(), title: "Entry", content: "Content", priority: .low)
        entryServiceMock.fetchEntryCompletionResult = .success(expectedEntry)
        
        // When
        entryDataProvider.fetchEntry(withID: expectedEntry.id) { result in
            switch result {
            case .success(let entry):
                // Then
                XCTAssertEqual(entry.title, expectedEntry.title, "Fetched entry does not match expected entry")
            case .failure(let error):
                XCTFail("Expected successful result, but got error: \(error)")
            }
        }
    }
}


class EntryServiceMock: EntryServiceProtocol {
    
    var fetchEntriesCompletionResult: Result<[Entry], Error>!
    var fetchEntryCompletionResult: Result<Entry, Error>!
    
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void) {
        completion(fetchEntriesCompletionResult)
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {
        completion(fetchEntryCompletionResult)
    }
}

