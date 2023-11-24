//
//  CardTransition.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 16/11/23.
//

import SwiftUI

extension AnyTransition {
    
    static var trailingButton : AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing).combined(with: .move(edge: .bottom)))
    }
    
    static var leadingButton: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading).combined(with: .move(edge: .bottom)))
    }
}
