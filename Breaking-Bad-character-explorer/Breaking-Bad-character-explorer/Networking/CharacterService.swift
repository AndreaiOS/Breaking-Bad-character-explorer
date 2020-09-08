//
//  CharacterService.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import Combine

final class CharacterService {
	
	var components: URLComponents {
		var components = URLComponents()
		components.scheme = "https"
		components.host = "breakingbadapi.com"
		components.path = "/api/characters"
		
		return components
	}
	
	func fetchCharacters() -> AnyPublisher<CharacterDataContainer, Error> {
		return URLSession.shared.dataTaskPublisher(for: components.url!)
			.map { $0.data }
			.decode(type: CharacterDataContainer.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	} 
	
	
}


