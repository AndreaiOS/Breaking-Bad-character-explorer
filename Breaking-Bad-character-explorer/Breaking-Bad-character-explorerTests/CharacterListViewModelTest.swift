//
//  CharacterListViewModelTest.swift
//  Breaking-Bad-character-explorerTests
//
//  Created by Andrea Murru on 09/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import XCTest
@testable import Breaking_Bad_character_explorer

class CharacterListViewModelTest: XCTestCase {

	func test_successLoadProductsCount() {
		let viewModel = CharacterListViewModel()
		viewModel.fetchCharacters()
		
		let expectation = XCTestExpectation()
		DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
			XCTAssertEqual(viewModel.characterViewModels.count, 63)

			expectation.fulfill()
		}
		wait(for: [expectation], timeout: 5.0)
	}
}
