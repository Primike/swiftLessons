//
//  AuctionItemModel.swift
//  SwiftLessons
//
//  Created by Prince Avecillas on 12/20/25.
//

import Foundation

struct AuctionItemModel: Decodable {
    var id = UUID()
    var symbol: String
    var currentPrice: String
    var expirationDate: TimeInterval
}
