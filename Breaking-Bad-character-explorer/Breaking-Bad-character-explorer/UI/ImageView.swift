//
//  ImageView.swift
//  Breaking-Bad-character-explorer
//
//  Created by Andrea Murru on 08/09/2020.
//  Copyright © 2020 Andrea. All rights reserved.
//

import Foundation
import SwiftUI

struct ImageView: View {
	@ObservedObject var imageLoader:ImageLoader
	@State var image:UIImage = UIImage()
	
	init(withURL url:String) {
		imageLoader = ImageLoader(urlString:url)
	}
	
	var body: some View {
		VStack { 
			Image(uiImage: image)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width:100, height:100)
		}.onReceive(imageLoader.dataPublisher) { data in
			self.image = UIImage(data: data) ?? UIImage()
		}
	}
}
struct ImageView_Previews: PreviewProvider {
	static var previews: some View {
		ImageView(withURL: "")
	}
}
