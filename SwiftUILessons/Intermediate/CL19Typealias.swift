//
//  CL19Typealias.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL19MovieModel {
    let title: String
    let director: String
    let count: Int
}

typealias TVModel = CL19MovieModel

struct CL19Typealias: View {
    @State var item: TVModel = TVModel(title: "Tv title", director: "Chungus", count: 1)
    var body: some View {
        VStack {
            Text(item.title)
            Text(item.director)
            Text("\(item.count)")
        }
    }
}

struct CL19Typealias_Previews: PreviewProvider {
    static var previews: some View {
        CL19Typealias()
    }
}
