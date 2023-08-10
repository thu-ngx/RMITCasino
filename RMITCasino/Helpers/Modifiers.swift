//
//  Modifiers.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color("black-transparent"), radius: 7)
    }
}

struct ScoreLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 10, weight: .bold, design: .rounded))
    }
}

struct ScoreNumberlStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .heavy, design: .rounded))
    }
}

struct ScoreCapsuleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .foregroundColor(Color("black-transparent"))
            )
    }
}

struct ReelImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 140)
            .modifier(ShadowModifier())
    }
}

struct IconImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 80)
            .modifier(ShadowModifier())
    }
}

struct BetCapsuleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 25, weight: .heavy))
            .modifier(ShadowModifier())
            .padding(.horizontal, 15)
            .padding(.vertical, 6)
            .background(
                Capsule()
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color("rmit-red"), Color("yellow")]), startPoint: .top, endPoint: .bottom)
                    )
            )
    }
}

struct CasinoChipModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(height: 65)
            .modifier(ShadowModifier())
    }
}

