//
//  ContentView.swift
//  Honey Moon
//
//  Created by Adriancys Jesus Villegas Toro on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingButton
    
    //Cards
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeyMoon: honeyMoonData[index]))
        }
        return views
    }()
    
    // MARK: - Move car
    private func moveCards() {
        cardViews.removeFirst()
        
        self.lastCardIndex += 1
        let honeyMoon = honeyMoonData[lastCardIndex % honeyMoonData.count]
        let newCardView = CardView(honeyMoon: honeyMoon)
        
        cardViews.append(newCardView)
    }
    
    // MARK: - Drag States
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case . dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    // MARK: - isTopCard
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id}) else { return false }
        return index == 0
    }
    
    // MARK: - Body
    
    var body: some View {

        
        VStack {
//            HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
//            CARDVIEW

            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(content: {
                            ZStack {
                                
                                //X Mark symbol
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                //Heart Symbol
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        })
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0)
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? Double(  self.dragState.translation.width / 12) : 0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: self.dragState.isDragging)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { value, state, transaction in
                                    
                                    switch value {
                                        
                                    case .first(true):
                                        state = .pressing
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = .leadingButton
                                    }
                                    
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = .trailingButton
                                    }
                                })
                                .onEnded({ (value) in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        
                                        playSound(sound: "sound-rise", type: "mp3")
                                        self.moveCards()
                                    }
                                })
                        
                        )
                        .transition(self.cardRemovalTransition)
                        
                }
            }
            .padding(.horizontal)
            
//        FIXME: Add padding to the card latter on
            
            
            Spacer()
            
//            FOOTERVIEW
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        }
        .alert( isPresented: $showAlert) {
            Alert(title: Text("Success"),
                  message: Text("Wishing a lovely and most precious of the times together for the amazing couple"),
                  dismissButton: .default(Text("Happy HoneyMoon!")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
