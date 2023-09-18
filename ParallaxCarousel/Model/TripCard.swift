//
//  TripCard.swift
//  ParallaxCarousel
//
//  Created by Amit Azulay on 14/09/2023.
//

import SwiftUI

struct TripCard: Identifiable, Hashable {
    var id: UUID = .init()
    var title: String
    var subtitle: String
    var image: String
}

var tripCards: [TripCard] = [
    .init(title: "Sri Lanka", subtitle: "South Asia", image: "SriLanka"),
    .init(title: "London", subtitle: "England", image: "London"),
    .init(title: "New York", subtitle: "USA", image: "NewYork"),
    .init(title: "Prague", subtitle: "Czech Republic", image: "Prague")
]
