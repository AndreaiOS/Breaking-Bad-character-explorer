//
//  CharacterListViewModel.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation

class CharacterListViewModel: ObservableObject {
	private let characterService = CharacterService()
	@Published var characterViewModels = [Character]()
	
}
