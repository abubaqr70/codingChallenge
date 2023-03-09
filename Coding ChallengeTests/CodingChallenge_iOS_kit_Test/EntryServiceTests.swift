//
//  EntryServiceTests.swift
//  Coding ChallengeTests
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import XCTest
@testable import Coding_Challenge

class EntryServiceTests: XCTestCase {
    
    var entryService: EntryService!
    var mockNetworkService: NetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = NetworkService()
        entryService = EntryService(networkService: mockNetworkService)
    }
    
    override func tearDown() {
        entryService = nil
        mockNetworkService = nil
        super.tearDown()
    }
    
    
    func testFetchEntries() {
        // Given
        let expectation = self.expectation(description: "Completion handler called")
        
        // When
        entryService.fetchEntries { result in
            switch result {
            case .success(let entries):
                // Then
                XCTAssertEqual(entries.count, 4)
            case .failure(let error):
                XCTFail("Unexpected error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
    func testFetchEntryWithID() {
        // Given
        let expectedEntry = Entry(id: UUID(), title: "Entry", content: "Content", priority: .low)
        let expectation = self.expectation(description: "Completion handler called")
        
        // When
        entryService.fetchEntry(withID: expectedEntry.id) { result in
            switch result {
            case .success(let entry):
                // Then
                XCTAssertEqual(entry.title, expectedEntry.title)
            case .failure(let error):
                XCTFail("Unexpected error: \(error.localizedDescription)")
            }
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}

class NetworkServiceMock: NetworkServiceProtocol {
    
    var fetchEntriesCompletionResult: Result<[Entry], Error>!
    var fetchEntryCompletionResult: Result<Entry, Error>!
    
    func fetchEntries(completion: @escaping (Result<[Entry], Error>) -> Void) {
        completion(fetchEntriesCompletionResult)
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {
        completion(fetchEntryCompletionResult)
    }
}
