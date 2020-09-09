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
	@State private var searchText : String = ""
	@State private var selectedSeasons: [Int] = [Int]()
	@State var showMenu: Bool = false
	
	var body: some View {
		// Adds drag gesture recognizer to hide the menu
		let drag = DragGesture()
			.onEnded {
				if $0.translation.width < -100 {
					withAnimation {
						self.showMenu = false
					}
				}
		}
		
		return NavigationView {			
			ZStack(alignment: .leading) {
				VStack {				
					List {  
						SearchBar(text: $searchText, placeholder: "Search character")
						
						ForEach(self.viewModel.characterViewModels.filter {
							return filter(characterViewModel: $0)						
						}, id: \.self) { characterViewModel in
							CharacterCell(characterViewModel: characterViewModel)				
						}
					}
					.offset(x: self.showMenu ? 200.0 : 0)
					.disabled(self.showMenu ? true : false)
					.onAppear {
						self.viewModel.fetchCharacters()
					}
					.navigationBarTitle("Characters", displayMode: .inline)
					.navigationBarItems(leading:
						Button(action: {
							withAnimation {
								self.showMenu = !self.showMenu
							}
						}) {
							Text("Filter")
						}
						
					).resignKeyboardOnDragGesture()
				}
				if self.showMenu {
					FiltersView(showMenu: self.$showMenu, selectedSeasons: self.$selectedSeasons)
						.frame(width: 200.0)
						.transition(.move(edge: .leading))
				}
			}
			
		}.gesture(drag)
	}
	
	func filter(characterViewModel: CharacterViewModel) -> Bool {
		if (self.searchText.isEmpty && self.selectedSeasons.isEmpty) {
			return true
		} else {
			if (self.searchText.isEmpty && !self.selectedSeasons.isEmpty) {
				let ts = characterViewModel.appearance.filter{ self.selectedSeasons.contains($0) }
				let contained = ts.count > 0
				return contained
			} else if (!self.searchText.isEmpty && self.selectedSeasons.isEmpty) {
				return characterViewModel.name.lowercased().contains(self.searchText.lowercased())
			} else {
				let ts = characterViewModel.appearance.filter{ self.selectedSeasons.contains($0) }
				let contained = ts.count > 0
				return contained && characterViewModel.name.lowercased().contains(self.searchText.lowercased()) 
			}
		}
	}
}



struct CharacterList_Previews: PreviewProvider {
	static var previews: some View {
		CharacterList()
	}
}
