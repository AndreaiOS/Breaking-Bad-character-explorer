//
//  CharacterViewModel.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation

// This is responsable for converting the Character object into something we can display
struct CharacterViewModel: Hashable {
	// We define our character as private
	private let character: Character
	
	init(_ character: Character) {
		self.character = character
	}
	
	// We can have computed properties
	var name: String {
		return character.name
	}
	
	var birthday: Date? {
		let dateString = character.birthday
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd-MM-yyyy"
		dateFormatter.locale = Locale.init(identifier: "en_GB")

		let dateObj = dateFormatter.date(from: dateString)

		return dateObj
	}
	
	var occupation: [String] {
		return character.occupation
	}
	
	var img: String {
		return character.img
	}
	
	var status: String {
		return character.status
	}
	
	var nickname: String {
		return character.nickname
	}
	
	var appearance: [Int] {
		return character.appearance
	}
	
	var portrayed: String {
		return character.portrayed
	}
	
	var category: String {
		return character.category
	}
	
	var betterCallSaulAppearance: [Int]? {
		return character.betterCallSaulAppearance
	}
}
