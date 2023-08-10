//
//  ReelView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct ReelView: View {
    var reelIcon: String
    var body: some View {
        ZStack {
            Image("reel")
                .resizable()
                .modifier(ReelImageModifier())
            
            Image(reelIcon)
                .resizable()
                .modifier(IconImageModifier())
            
        }
    }
}

struct ReelView_Previews: PreviewProvider {
    static var previews: some View {
        ReelView(reelIcon: "cherry")
            .previewLayout(.sizeThatFits)
    }
}