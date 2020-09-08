//
//  CharacterCell.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CharacterCell: View {
	let characterViewModel: CharacterViewModel
	var body: some View {
		return NavigationLink(destination: CharacterDetail(character: characterViewModel)) {
		
			WebImage(url: URL(string: characterViewModel.img))
				.onSuccess { image, data, cacheType in
			}
			.resizable()
			.placeholder(Image("BreakingBadPlaceholder"))
				.indicator(.activity) // Activity Indicator
				.transition(.fade(duration: 0.1)) // Fade Transition with duration
				.scaledToFit()
				.frame(width: 80, height: 80, alignment: .center)
			.clipShape(Circle())
			.overlay(
				Circle().stroke(Color.orange, lineWidth: 4)
			)
			.shadow(radius: 10)

			VStack(alignment: .leading) {
				Text(characterViewModel.name)
				Text(characterViewModel.nickname)
					.font(.subheadline)
					.foregroundColor(.gray)
			}
		}
	}
}

struct CharacterCell_Previews: PreviewProvider {
	static var previews: some View {
		/*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
	}
}
