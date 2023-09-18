//
//  Home.swift
//  ParallaxCarousel
//
//  Created by Amit Azulay on 14/09/2023.
//

import SwiftUI

struct Home: View {
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 10) {
                HStack(spacing: 12) { }
                
                Text("Where do you want to \ntravel?")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 24)
                    .padding(.leading, 12)
                
                // Created by Amit Azulay on 14/09/2023.
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 0) {
                            ForEach(tripCards.indices, id: \.self) { index in
                                let card = tripCards[index]
                                
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    let minX = proxy.frame(in: .scrollView).minX - 30.0
                                    let page = Int((minX + (size.width / 2)) / size.width)
                                    
                                    Image(card.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .offset(x: -minX)
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(width: cardSize.width,
                                               height: cardSize.height)
                                        .overlay(content: {
                                            OverlayView(card)
                                        })
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25),
                                                radius: 8, x: 5, y: 10)
                                })
                                .frame(width: size.width - 60,
                                       height: size.height - 50)
                                .scrollTransition(.interactive, axis: .horizontal) { view , phase in
                                    view.scaleEffect(phase.isIdentity ? 1 : 0.9)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()
                        .frame(height: size.height,
                               alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .scrollIndicators(.hidden)
                })
                .frame(height: 560)
                .padding(.horizontal, -15)
                .padding(.top, 10)
                
                HStack(spacing: 15) {
                    ForEach(tripCards.indices, id: \.self) { index in
                        Capsule()
                            .fill(Color.black)
                            .frame(width: 8, height: 8)
                    }
                }
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
    
    @ViewBuilder
    func OverlayView(_ card: TripCard) -> some View {
        ZStack(alignment: .bottomLeading, content: {
            LinearGradient(colors: [
                .clear,
                .clear,
                .clear,
                .clear,
                .clear,
                .black.opacity(0.1),
                .black.opacity(0.5),
                .black
            ], startPoint: .top, endPoint: .bottom)
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(card.title)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(.white)
                
                Text(card.subtitle)
                    .font(.callout)
                    .foregroundStyle(.white.opacity(0.8))
            })
            .padding(20)
        })
    }
}

#Preview {
    ContentView()
}
