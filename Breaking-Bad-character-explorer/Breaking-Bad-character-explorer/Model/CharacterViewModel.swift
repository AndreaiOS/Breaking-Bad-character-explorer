//
//  CharacterViewModel.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import SwiftUI

// This is responsable for converting the Character object into something we can display

struct CharacterViewModel {
	// We define our character as private
	private let character: Character
	
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
	
	
}
