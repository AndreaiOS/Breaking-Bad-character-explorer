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
	
	var body: some View {
		NavigationView {
			VStack {				
				List {  
					SearchBar(text: $searchText, placeholder: "Search character")
					
					ForEach(self.viewModel.characterViewModels.filter {
						return filter(characterViewModel: $0)						
					}, id: \.self) { characterViewModel in
						CharacterCell(characterViewModel: characterViewModel)				
					}
				}
				.onAppear {
					self.viewModel.fetchCharacters()
				}
				.navigationBarTitle("Characters")
				.navigationBarItems(trailing:
					NavigationLink(destination: FiltersView(selectedSeasons: $selectedSeasons)) {
						Text("Filters")
					}
				)
				.resignKeyboardOnDragGesture()
			}
		}
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


struct SearchBar: UIViewRepresentable {

    @Binding var text: String
    var placeholder: String

    class Coordinator: NSObject, UISearchBarDelegate {

        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
		
		func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
			UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
		}
    }

    func makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }

    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = placeholder
        searchBar.searchBarStyle = .minimal
        searchBar.autocapitalizationType = .none
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        CharacterList()
    }
}
