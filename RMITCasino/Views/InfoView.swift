//
//  InfoView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 26/08/2023.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        LogoView()
        Button {
            dismiss()
        } label: {
            Text("Close sheet")
        }

    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
