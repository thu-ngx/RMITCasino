//
//  ReelView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct ReelView: View {
    var reelIcon: String
    var animatingIcon: Bool
    
    var body: some View {
        ZStack {
            Image("reel")
                .resizable()
                .modifier(ReelImageModifier())
            
            Image(reelIcon)
                .resizable()
                .modifier(IconImageModifier())
                .opacity(animatingIcon ? 1 : 0)
                .offset(y: animatingIcon ? 0 : -50)
                .animation(.easeOut, value: animatingIcon)
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView(reelIcon: "cherry", animatingIcon: false)
            .previewLayout(.sizeThatFits)
        ReelView(reelIcon: "cherry", animatingIcon: true)
            .previewLayout(.sizeThatFits)
    }
}
