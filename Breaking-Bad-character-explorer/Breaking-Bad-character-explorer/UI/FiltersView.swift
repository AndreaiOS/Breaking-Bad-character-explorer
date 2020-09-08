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

	
    var body: some View {
        VStack {
			Text("character.name")
                .font(.title)
			Text("character.occupation.description")
                .font(.subheadline)

			Divider()

			Text("character.status")
                .font(.headline)
			Text("character.nickname")
			.font(.headline)
			Button("Help") {
				print("Selected s \(self.selectedSeasons.description)")
				self.selectedSeasons.append(69)
			}

        //2
        }.padding()
			
    }
}
