//
//  RickAndMortyAppTests.swift
//  RickAndMortyAppTests
//
//  Created by Santiago Castaneda on 16/04/24.
//

import XCTest
@testable import RickAndMortyApp

final class RickAndMortyAppTests: XCTestCase {

    var viewmodel: CharactersViewModel!

    override func setUpWithError() throws {
        viewmodel = CharactersViewModel()
    }

    override func tearDownWithError() throws {
        viewmodel = nil
    }

    func testSuccessCharactersLoad() {
        let expectation = XCTestExpectation(description: "Characters loaded successfully")
        
        viewmodel.characters = Characters(info: Info(count: 12, pages: 1, next: nil, prev: nil), results: [Character(id: 2, name: "Morty Smith", status: .alive, species: "Human", type: "", gender: .male, origin: Location(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z"), Character(id: 1, name: "Morty Smith", status: .alive, species: "Human", type: "", gender: .male, origin: Location(name: "unknown", url: ""), location: Location(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", episode: [], url: "https://rickandmortyapi.com/api/character/2", created: "2017-11-04T18:50:21.651Z")])
        viewmodel.isLoading = false
        
        XCTAssertEqual(viewmodel.characters?.results.count, 2)
        XCTAssertFalse(viewmodel.isLoading)
        
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testEmptyCharacters() {
        let expectation = XCTestExpectation(description: "Characters empty")
        
        viewmodel.characters = Characters(info: Info(count: 12, pages: 1, next: nil, prev: nil), results: [])
        viewmodel.isLoading = false
        
        XCTAssertEqual(viewmodel.characters?.results.count, 0)
        XCTAssertFalse(viewmodel.isLoading)
        
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testDecodingError() {
        let expectation = XCTestExpectation(description: "Decoding error")
        
        viewmodel.errorMessage = "Failed to decode data"
        viewmodel.isLoading = false
        
        XCTAssertEqual(viewmodel.errorMessage, "Failed to decode data")
        XCTAssertFalse(viewmodel.isLoading)
        
        expectation.fulfill()
        wait(for: [expectation], timeout: 1.0)
    }

}
