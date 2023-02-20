//
//  DessertViewModelTests.swift
//  iOSChallenge_FredyCamas_02192023Tests
//
//  Created by FredyCamas on 2/20/23.
//

import XCTest
@testable import iOSChallenge_FredyCamas_02192023

final class DessertViewModelTests: XCTestCase {
    
    var viewModel: DessertViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = DessertViewModel()
    }
    
    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }
    
    func testSearchCards() {
        viewModel.searchCards(cardText: "")
        XCTAssertEqual(viewModel.cards, viewModel.mainCardContainer.sorted { $0.name < $1.name })
        
        viewModel.searchCards(cardText: "Banana")
        XCTAssertTrue(viewModel.cards.count == 0)
        
        viewModel.searchCards(cardText: "2333333") // there is not cards with names as numbers
        XCTAssertTrue(viewModel.cards.count == 0)
    }
    
    func testFetchDessert() {
        let expectation = self.expectation(description: "expectation")
        
        viewModel.fetchDessert()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertNotNil(self.viewModel.cards)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
    
    func testFetchDessertDetail() {
        let expectation = self.expectation(description: "expectation")
        let cardId = "53049" 
        
        viewModel.fetchDessertDetail(id: cardId)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            XCTAssertTrue(self.viewModel.detailcard.count > 0)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10)
    }
}
