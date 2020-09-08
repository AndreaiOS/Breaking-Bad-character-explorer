//
//  CharacterListViewModel.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import Combine

class CharacterListViewModel: ObservableObject {
	private let characterService = CharacterService()
	@Published var characterViewModels = [CharacterViewModel]()
	
	var cancellable: AnyCancellable?
	
	// This is going to be called when our view appears
	func fetchCharacters() {
		// This is going to store subscriptions
		// If we don't store it Combine will deallocate subscriptions
		// and the network request will not complete properly
		cancellable = characterService
			.fetchCharacters().sink(receiveCompletion: { _ in

			}, receiveValue: { characterContainer in
				self.characterViewModels = characterContainer.map { CharacterViewModel($0) } 
				print(self.characterViewModels)
			})
	}
	
}
