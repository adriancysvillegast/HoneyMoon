//
//  GuideView.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 15/11/23.
//

import SwiftUI

struct GuideView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    // MARK: - Body
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("Get Started!")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                Text("Discover and pick the perfect destination for your romantic Honeymoon")
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 10)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subTitle: "Swipe right",
                        description: "Do you like this destination? Touch the screen and swipe right. it will be saved to the favourites",
                        icon: "heart.circle")
                    
                    GuideComponent(
                        title: "Dismiss",
                        subTitle: "Swipe Left",
                        description: "Would you rather skip this place? Touch the screen and swipe left. you will no longer see it",
                        icon: "xmark.circle")
                    
                    GuideComponent(
                        title: "Book",
                        subTitle: "Tap the button",
                        description: "Our selection of honeymoon resorts is perfect setting for you to embark your new life together",
                        icon: "checkmark.square")
                }
                
                Spacer(minLength: 10)
                Button {
//                    print("button was tap")
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }

                
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
            
            
        }
    }
}

// MARK: - Preview

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView()
    }
}
