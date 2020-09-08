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
		NavigationView {
			List(viewModel.characterViewModels, id: \.self) { characterViewModel in 
				HStack(alignment: .center, spacing: 0.0) {
					ImageView(withURL: characterViewModel.img) 
					Text(characterViewModel.name)
				}.alignmentGuide(.leading) { (dimesions) -> CGFloat in
					return 8.0
				}
				
			}.onAppear {
				self.viewModel.fetchCharacters()
			}.navigationBarTitle("Characters")
		}
		
    }

	static var defaultImage = UIImage(named: "NewsIcon")

}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}


