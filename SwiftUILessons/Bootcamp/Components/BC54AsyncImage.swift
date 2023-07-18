//
//  BC54AsyncImage.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/24/23.
//

import SwiftUI

struct BC54AsyncImage: View {
    
    let url = URL(string: "https://images.theconversation.com/files/521751/original/file-20230419-18-hg9dc3.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop")
    
    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .cornerRadius(20)
            case .failure(_):
                Image(systemName: "questionmark")
                    .font(.headline)
            @unknown default:
                Image(systemName: "questionmark")
                    .font(.headline)
            }
        }
//        //cached
//        AsyncImage(url: url) { image in
//            image
//                .resizable()
//                .scaledToFit()
//                .frame(width: 100, height: 100)
//                .cornerRadius(20)
//        } placeholder: {
//            ProgressView()
//        }
    }
}

struct BC54AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        BC54AsyncImage()
    }
}
