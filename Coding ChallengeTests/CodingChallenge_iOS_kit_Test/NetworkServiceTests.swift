//
//  NetworkServiceTests.swift
//  Coding ChallengeTests
//
//  Created by Mohammad Abubaqr on 09/03/2023.
//

import Foundation
import XCTest
@testable import Coding_Challenge

class NetworkServiceTests: XCTestCase {
    
    var networkService: NetworkServiceMock!

    override func setUp() {
        super.setUp()
        networkService = NetworkServiceMock()
    }

    override func tearDown() {
        networkService = nil
        super.tearDown()
    }
    
    func testFetchEntries() {
        let expectation = XCTestExpectation(description: "Fetch entries from network")
        
        networkService.fetchEntries { result in
            switch result {
            case .success(let entries):
                XCTAssert(entries.count == 4, "Expected 4 entries, but got \(entries.count)")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Fetching entries failed with error: \(error.localizedDescription)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testFetchEntry() {
        let expectation = XCTestExpectation(description: "Fetch entry from network")
        let testID = UUID()
        
        networkService.fetchEntry(withID: testID) { result in
            switch result {
            case .success(let entry):
                XCTAssert(entry.id == testID, "Expected entry with ID \(testID), but got entry with ID \(entry.id)")
                expectation.fulfill()
            case .failure(let error):
                XCTFail("Fetching entry failed with error: \(error.localizedDescription)")
            }
        }
        
        wait(for: [expectation], timeout: 5.0)
    }

}
