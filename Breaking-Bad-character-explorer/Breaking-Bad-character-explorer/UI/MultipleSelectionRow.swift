//
//  MultipleSelectionRow.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 09/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
				.foregroundColor(.black)
					.font(.subheadline)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
						.foregroundColor(.black)
                }
            }
		}
	}
}

struct MultipleSelectionRow_Previews: PreviewProvider {
	static var previews: some View {
		MultipleSelectionRow(title: "Season 1", isSelected: true) { 
		}
	}
}
