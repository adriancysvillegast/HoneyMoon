//
//  CardView.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 14/11/23.
//

import SwiftUI

struct CardView: View, Identifiable {
    // MARK: - Properties
    
    let id = UUID()
    let honeyMoon: Destination
    
    
    // MARK: - Body
    
    var body: some View {
        Image(honeyMoon.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(alignment: .bottom) {
                VStack(alignment: .center, spacing: 12) {
                    Text(honeyMoon.place.uppercased())
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(alignment: .bottom) {
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1)
                        }
                    
                    Text(honeyMoon.country.uppercased())
                        .foregroundColor(.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )
                }
                .frame(minWidth: 280)
                .padding(.bottom, 50)
                
            }
            
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(honeyMoon: honeyMoonData[0])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
