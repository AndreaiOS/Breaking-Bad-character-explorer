//
//  ContentView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CharacterList: View {
	@ObservedObject private var viewModel = CharacterListViewModel()
    var body: some View {
		NavigationView {
			
			List(viewModel.characterViewModels, id: \.self) { characterViewModel in 
				HStack(alignment: .center, spacing: 0.0) {
					
					WebImage(url: URL(string: characterViewModel.img))
					.onSuccess { image, data, cacheType in
					}
					.resizable()
					.placeholder(Image("BreakingBadPlaceholder"))
					.indicator(.activity) // Activity Indicator
					.transition(.fade(duration: 0.1)) // Fade Transition with duration
					.scaledToFit()
					.frame(width: 80, height: 80, alignment: .center)
					
					
					Text(characterViewModel.name)
				}.alignmentGuide(.leading) { (dimesions) -> CGFloat in
					return 8.0
				}
				
			}.onAppear {
				self.viewModel.fetchCharacters()
			}.navigationBarTitle("Characters")
		}
		
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}


