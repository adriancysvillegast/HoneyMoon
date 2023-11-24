//
//  InfoView.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 15/11/23.
//

import SwiftUI

struct InfoView: View {
    // MARK: - Properties
    @Environment(\.presentationMode) var presentationMode
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CredictsView()
                
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

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowInfoView(itemOne: "Application", itemTwo: "HoneyMoon")
            RowInfoView(itemOne: "Compatibility", itemTwo: "iPhone, iPad")
            RowInfoView(itemOne: "Dveloper", itemTwo: "Adriancys Villegas")
            RowInfoView(itemOne: "Designer", itemTwo: "Rober Petras")
            RowInfoView(itemOne: "Version", itemTwo: "1.0.0")
            
        }
    }
}

struct RowInfoView: View {
    
    // MARK: - Properties
    var itemOne: String
    var itemTwo: String
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack {
                Text(itemOne).foregroundColor(.gray)
                Spacer()
                Text(itemTwo)
            }
        }
        Divider()
    }
}

struct CredictsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Photos")
                    .foregroundColor(.gray)
                Spacer()
                Text("Unsplash")
            }
            Divider()
            Text("Photographers")
                .foregroundColor(.gray)
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .multilineTextAlignment(.leading)
                .font(.footnote)
        }
    }
}
