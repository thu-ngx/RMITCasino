//
//  ContentView.swift
//  RMITCasino
//
//  Created by Thu Nguyen  on 09/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTIES
    //    let icons = ["apple","bar","bell","cherry","clover","diamond", "grape", "heart", "horseshoe","lemon","melon","money","orange"]
    
    let icons = ["apple","bar","bell"]
    
    @State var reels = [0, 1, 2]
    @State var coins = 100
    @State var betAmount = 10
    @AppStorage("highscore") var highscore = 0
    
    @State var isChooseBet10 = true
    @State var isChooseBet20 = false
    
    @State var animatingIcon = true
        
    // MARK: - SPIN LOGIC
    func spinReels() {
        reels = reels.map({ _ in
            Int.random(in: 0...icons.count-1)
        })
    }
    
    // MARK: GAME LOGIC FUNCTIONS
    
    // MARK: CHECKING WINNING LOGIC
    func checkWinning() {
        if (reels[0] == reels[1] && reels[1] == reels[2] && reels[2] == reels[0] ) {
            // WINNING LOGIC
            playerWins()
            
            // HIGH SCORE
            if coins > highscore {
                newHighscore()
            }
        } else {
            // LOSING LOGIC
            playerLoses()
        }
    }
    
    // MARK: PLAYER WINNING LOGIC
    func playerWins() {
        coins += betAmount*10
    }
    
    // MARK: HIGHSCORE LOGIC
    func  newHighscore() {
        highscore = coins
        UserDefaults.standard.set(highscore, forKey: "highscore")
    }
    
    // MARK: PLAYER LOSING LOGIC
    func playerLoses() {
        coins -= betAmount
    }
    
    // MARK: BET 20 LOGIC
    func chooseBet20(){
        betAmount = 20
        isChooseBet20 = true
        isChooseBet10 = false
    }
    
    // MARK: BET 10 LOGIC
    func chooseBet10(){
        betAmount = 10
        isChooseBet10 = true
        isChooseBet20 = false
    }
    
    // MARK: GAMEOVER LOGIC
    
    // MARK: RESET LOGIC
    
    
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
                            Text("\(coins)")
                                .modifier(ScoreNumberlStyle())
                        }
                        .modifier(ScoreCapsuleStyle())
                    }
                    Spacer()
                    HStack {
                        HStack {
                            Text("\(highscore)")
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
                    ReelView(reelIcon: icons[reels[0]], animatingIcon: animatingIcon)
                    HStack {
                        ReelView(reelIcon: icons[reels[1]], animatingIcon: animatingIcon)
                        ReelView(reelIcon: icons[reels[2]], animatingIcon: animatingIcon)
                    }
                    
                    Button {
                        withAnimation {
                            animatingIcon = false
                        }
                        
                        spinReels()
                        
                        withAnimation {
                            animatingIcon = true
                        }
                        
                        checkWinning()
                    } label: {
                        Image("spin")
                            .resizable()
                            .modifier(ReelImageModifier())
                    }
                }
                
                Spacer()
                
                HStack {
                    
                    // MARK: - BET 20$
                    Button {
                        chooseBet20()
                    } label: {
                        HStack {
                            Text("20")
                                .modifier(BetCapsuleModifier())
                            
                            Image("casino-chips")
                                .resizable()
                                .opacity(isChooseBet20 ? 1 : 0)
                                .modifier(CasinoChipModifier())
                            
                        }
                    }
                    
                    Spacer()
                    
                    // MARK: - BET 10$
                    Button {
                        chooseBet10()
                    } label: {
                        HStack {
                            Image("casino-chips")
                                .resizable()
                                .opacity(isChooseBet10 ? 1 : 0)
                                .modifier(CasinoChipModifier())
                            Text("10")
                                .modifier(BetCapsuleModifier())
                        }
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
