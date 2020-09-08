//
//  FiltersView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import SwiftUI

struct FiltersView: View {
	
	@Binding var selectedSeasons: [Int]
	let items = [1, 2, 3, 4, 5]
	
    var body: some View {
        List {
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
    }
}

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}
