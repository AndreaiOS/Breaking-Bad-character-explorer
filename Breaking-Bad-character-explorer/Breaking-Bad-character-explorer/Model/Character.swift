//
//  Character.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation

struct Character: Decodable, Hashable {
	let name: String
	let birthday: String
	let occupation: [String]
	let img: String
	let status: String
	let nickname: String
	let appearance: [Int]
	let portrayed: String
	let category: String
	let betterCallSaulAppearance: [Int]?
}
