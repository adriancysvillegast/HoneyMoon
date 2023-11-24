//
//  GuideComponent.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 15/11/23.
//

import SwiftUI

struct GuideComponent: View {
    // MARK: - Properties
    var title: String
    var subTitle: String
    var description: String
    var icon: String
    
    // MARK: - Body
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            Image(systemName: icon)
                .font(.largeTitle)
                .foregroundColor(.pink)
            
            VStack(alignment: .leading, spacing: 4) {
                HStack{
                    Text(title.uppercased())
                        .font(.title)
                        .fontWeight(.heavy)
                    
                    Spacer()
                    
                    Text(subTitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(.pink)
                }
                
                Divider().padding(.bottom, 4)
                
                Text(description)
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(title: "Title", subTitle: "Swipe right", description: "This is a placeholder sentense. This is a placeholder sentense. This is a placeholder sentense.", icon: "heart.circle")
            .previewLayout(.sizeThatFits)
    }
}
