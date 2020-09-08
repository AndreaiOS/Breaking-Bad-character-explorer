//
//  ContentView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import SwiftUI

struct CharacterList: View {
	private let viewModel = CharacterListViewModel()
    var body: some View {
        Text("Hello, WorldZ!")
			.onAppear { 
				self.viewModel.fetchCharacters()
		}
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}


