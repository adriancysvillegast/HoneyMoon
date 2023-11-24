//
//  HeaderView.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 15/11/23.
//

import SwiftUI

struct HeaderView: View {
    
    // MARK: - Properties
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    let haptics = UINotificationFeedbackGenerator()
    // MARK: - Body
    var body: some View {
        HStack {
            Button {
                playSound(sound: "sound-click", type: "mp3")
                self.showInfoView.toggle()
                self.haptics.notificationOccurred(.success)
            } label: {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
       
            Spacer()
            
            Image("logo-honeymoon-pink")
                .resizable()
                .scaledToFit()
                .frame(height: 26)
            
            Spacer()
            
            Button {
//                print("guide")
                playSound(sound: "sound-click", type: "mp3")
                self.showGuideView.toggle()
                self.haptics.notificationOccurred(.success)
            } label: {
                Image(systemName: "questionmark.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .tint(.primary)
            .sheet(isPresented: $showGuideView) {
                GuideView()
            }

        }
        .padding()
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
