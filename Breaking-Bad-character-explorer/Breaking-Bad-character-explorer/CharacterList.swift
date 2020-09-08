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
						if (self.searchText.isEmpty && self.selectedSeasons.isEmpty) {
							return true
						} else {
							if (self.searchText.isEmpty && !self.selectedSeasons.isEmpty) {
								let ts = $0.appearance.filter{ self.selectedSeasons.contains($0) }
								let contained = ts.count > 0
						
								return contained
							} else if (!self.searchText.isEmpty && self.selectedSeasons.isEmpty) {
								return $0.name.lowercased().contains(self.searchText.lowercased())
							} else {
								let ts = $0.appearance.filter{ self.selectedSeasons.contains($0) }
								let contained = ts.count > 0
								return contained && $0.name.lowercased().contains(self.searchText.lowercased()) 
							}
						}
					}, id: \.self) { characterViewModel in
						CharacterCell(characterViewModel: characterViewModel)				
					}
					}
				.onAppear {
					self.viewModel.fetchCharacters()
				}
				.navigationBarTitle("Characters")
				.navigationBarItems(trailing:
					
					// devo aggiornare la tabella quando rientro
					// le stagioni sono 4, easy
					
					
					
					NavigationLink(destination: FiltersView(selectedSeasons: $selectedSeasons)) {
						Text("Filters")
					}
				)
				.resignKeyboardOnDragGesture()
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
