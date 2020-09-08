//
//  ContentView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import SwiftUI

struct CharacterList: View {
	@ObservedObject private var viewModel = CharacterListViewModel()
    var body: some View {
		List(viewModel.characterViewModels, id: \.self) { characterViewModel in 
			Text(characterViewModel.name)
		}.onAppear {
			self.viewModel.fetchCharacters()
		}
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}


