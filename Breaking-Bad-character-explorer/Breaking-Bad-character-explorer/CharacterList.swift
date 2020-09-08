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

    var body: some View {
		NavigationView {
            VStack {

			SearchBar(text: $searchText, placeholder: "Search character")
//			List(viewModel.characterViewModels, id: \.self) { characterViewModel in
				List {  

				ForEach(self.viewModel.characterViewModels.filter {
					self.searchText.isEmpty ? true : $0.name.lowercased().contains(self.searchText.lowercased())
				}, id: \.self) { characterViewModel in
					CharacterCell(characterViewModel: characterViewModel)				
				}
			
		}
				.onAppear {
					self.viewModel.fetchCharacters()
				}.navigationBarTitle("Characters")
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
