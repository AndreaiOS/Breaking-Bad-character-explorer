//
//  CharacterViewModelTest.swift
//  Breaking-Bad-character-explorerTests
//
//  Created by Andrea Murru on 09/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import XCTest
@testable import Breaking_Bad_character_explorer

class CharacterViewModelTest: XCTestCase {	
	let mockedModel: Character = Character(name: "Walter White", 
			  birthday: "09-07-1958", 
			  occupation: ["High School Chemistry Teacher", "Meth King Pin"], 
			  img: "https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg", 
			  status: "Presumed dead", 
			  nickname: "Heisenberg", 
			  appearance: [1, 2, 3, 4, 5], 
			  portrayed: "Bryan Cranston", 
			  category: "Breaking Bad", 
			  betterCallSaulAppearance: nil)	
	
    func testViewModel() throws {
		let mockedViewModel: CharacterViewModel = CharacterViewModel(mockedModel)		
		
		XCTAssertEqual(mockedViewModel.name, mockedModel.name)
		XCTAssertEqual(mockedViewModel.occupation, mockedModel.occupation)
		XCTAssertEqual(mockedViewModel.img, mockedModel.img)
		XCTAssertEqual(mockedViewModel.status, mockedModel.status)
		XCTAssertEqual(mockedViewModel.nickname, mockedModel.nickname)
		XCTAssertEqual(mockedViewModel.appearance, mockedModel.appearance)
		XCTAssertEqual(mockedViewModel.portrayed, mockedModel.portrayed)
		XCTAssertEqual(mockedViewModel.category, mockedModel.category)
		XCTAssertEqual(mockedViewModel.betterCallSaulAppearance, mockedModel.betterCallSaulAppearance)
	}
}
