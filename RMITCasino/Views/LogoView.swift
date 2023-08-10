//
//  LogoView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("rmit-casino-welcome-logo")
            .resizable()
            .scaledToFit()
            .frame(height: 200)
            .modifier(ShadowModifier())
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        LogoView()
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}
