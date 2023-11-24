//
//  TitleModifier.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 15/11/23.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.pink)
    }
}


