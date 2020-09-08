//
//  CharacterDetail.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct CharacterDetail: View {
	
	var character: CharacterViewModel
	
    var body: some View {
        VStack {
			WebImage(url: URL(string: character.img))
				.onSuccess { image, data, cacheType in
			}
			.resizable()
			.placeholder(Image("BreakingBadPlaceholder"))
				.indicator(.activity) // Activity Indicator
				.transition(.fade(duration: 0.1)) // Fade Transition with duration
				.scaledToFit()
				.frame(width: 200, height: 200, alignment: .center)
			.clipShape(Circle())
			.overlay(
				Circle().stroke(Color.orange, lineWidth: 4)
			)
			.shadow(radius: 10)

			
			Text(character.name)
                .font(.title)
			Text(character.occupation.description)
                .font(.subheadline)
            //1
            Divider()

			Text(character.status)
                .font(.headline)
			Text(character.nickname)
			.font(.headline)
			Text(character.betterCallSaulAppearance != nil ? character.betterCallSaulAppearance!.description : "")
			.font(.headline)

        //2
        }.padding()
    }
}
