//
//  EntriesViewModelTests.swift
//  Coding ChallengeTests
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import XCTest
@testable import Coding_Challenge

class EntriesViewModelTests: XCTestCase {
    
    var dataLayer : MockEntryDataProvider!
    var viewModel : EntriesViewModel!
    
    override func setUp() {
        super.setUp()
        
        dataLayer = MockEntryDataProvider()
        viewModel = EntriesViewModel(dataLayer: dataLayer, minPriority: .medium)
    }
    
    
    override func tearDown() {
        dataLayer = nil
        viewModel = nil
        super.tearDown()
    }

    func testFetchEntries() {
     
        viewModel.fetchEntries()
        
        // Then
        XCTAssertTrue(!viewModel.isLoading)
        XCTAssertNil(viewModel.error)
        XCTAssertEqual(viewModel.entries.count, 3)
        XCTAssertEqual(viewModel.entries[0].title, "First entry")
        XCTAssertEqual(viewModel.entries[1].title, "Second entry")
    }
}

// A mock data provider that returns a fixed set of entries
class MockEntryDataProvider: EntryDataProviderProtocol {
    func fetchEntries(priorityLevel: Priority, completion: @escaping (Result<[Entry], Error>) -> Void) {
        let entries = [                Entry(id: UUID(), title: "First entry", content: "This is the first entry", priority: .high),                Entry(id: UUID(), title: "Second entry", content: "This is the second entry", priority: .medium),                Entry(id: UUID(), title: "Third entry", content: "This is the third entry", priority: .low),                Entry(id: UUID(), title: "Fourth entry", content: "This is the fourth entry", priority: .high),            ]
        completion(.success(entries))
    }
    
    func fetchEntry(withID id: UUID, completion: @escaping (Result<Entry, Error>) -> Void) {}
}
