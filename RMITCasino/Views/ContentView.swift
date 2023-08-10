//
//  ContentView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    let icons = ["apple","bar","bell","cherry","clover","diamond", "grape", "heart", "horseshoe","lemon","melon","money","orange"]
    
    @State var reels = [0, 1, 2]
    
    // MARK: - SPIN LOGIC
    func spinReels() {
        reels[0] = Int.random(in: 0...icons.count-1)
        reels[1] = Int.random(in: 0...icons.count-1)
        reels[2] = Int.random(in: 0...icons.count-1)
    }
        
    
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("rmit-red"), Color("purple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - LOGO HEADER
            VStack {
                LogoView()
                
                // MARK: - SCORE
                HStack {
                    HStack {
                        HStack {
                            Text("Your\nMoney".uppercased())
                                .modifier(ScoreLabelStyle())
                            Text("100")
                                .modifier(ScoreNumberlStyle())
                        }
                        .modifier(ScoreCapsuleStyle())
                    }
                    Spacer()
                    HStack {
                        HStack {
                            Text("200")
                                .modifier(ScoreNumberlStyle())
                            Text("High\nScore".uppercased())
                                .modifier(ScoreLabelStyle())
                            
                        }
                        .modifier(ScoreCapsuleStyle())
                    }
                }
                
                Spacer()
                
                // MARK: - REEL SLOT MACHINE
                VStack {
                    ReelView(reelIcon: icons[reels[0]])
                    HStack {
                        ReelView(reelIcon: icons[reels[1]])
                        ReelView(reelIcon: icons[reels[2]])
                    }
                    
                    Button {
                        spinReels()
                    } label: {
                        Image("spin")
                            .resizable()
                            .modifier(ReelImageModifier())
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    // MARK: - BET 20$
                    HStack {
                        Text("20")
                            .modifier(BetCapsuleModifier())
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10$
                    HStack {
                        Image("casino-chips")
                            .resizable()
                            .modifier(CasinoChipModifier())
                        Text("20")
                            .modifier(BetCapsuleModifier())
                    }
                    
                }
                
            } // VStack
            .padding()
        } // ZStack
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
