//
//  FiltersView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import SwiftUI

struct FiltersView: View {
	
	@Binding var showMenu: Bool
	@Binding var selectedSeasons: [Int]
	let items = [1, 2, 3, 4, 5]
	
    var body: some View {
		List {
			Text("Select seasons")
			.foregroundColor(.black)
				.font(.headline)
				
            ForEach(self.items, id: \.self) { item in
                MultipleSelectionRow(title: "Season \(item)", isSelected: self.selectedSeasons.contains(item)) {
                    if self.selectedSeasons.contains(item) {
                        self.selectedSeasons.removeAll(where: { $0 == item })
                    }
                    else {
                        self.selectedSeasons.append(item)
                    }
                }
            }
		}
		.colorMultiply(.gray)
		.padding(.top, 90)
		.frame(maxWidth: .infinity, alignment: .leading)
		.edgesIgnoringSafeArea(.all)
    }
}

