//
//  CharacterTest.swift
//  Breaking-Bad-character-explorerTests
//
//  Created by Andrea Murru on 09/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import XCTest
@testable import Breaking_Bad_character_explorer

class CharacterTest: XCTestCase {
	let mockedResponse: Dictionary<String, Any> = [
		"char_id":1,
		"name":"Walter White",
		"birthday":"09-07-1958",
		"occupation":["High School Chemistry Teacher","Meth King Pin"],
		"img":"https://images.amcnetworks.com/amc.com/wp-content/uploads/2015/04/cast_bb_700x1000_walter-white-lg.jpg",
		"status":"Presumed dead",
		"nickname":"Heisenberg",
		"appearance":[1,2,3,4,5],
		"portrayed":"Bryan Cranston",
		"category":"Breaking Bad",
		"better_call_saul_appearance":[],]
	
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

    func testModel() throws {
        let jsonData = try JSONSerialization.data(withJSONObject: mockedResponse, options: [])
        let decoder = JSONDecoder()
        let response = try decoder.decode(Character.self, from: jsonData)

		XCTAssertEqual(response, mockedModel)
	}
}
