//
//  ContentView.swift
//  NumberGuessing
//
//  Created by Babypowder on 27/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State var game = Game()
    @State var guess: Float = 0
    @State var checkResult = false
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Guess the number")
                    .padding(.top)
                    .font(
                        .custom("AmericanTypewriter",fixedSize: 25)
                        .weight(.semibold)
                    )
                Image("cat")
                    .resizable()
                    .frame(width: 200, height: 210)
                    .overlay(
                        Text("\(Int(guess))")
                            .foregroundColor(.darkergray)
                            .font(
                                .custom("AmericanTypewriter",fixedSize: 80)
                            )
                    )
                HStack {
                    Text("0")
                    Slider(value: $guess, in: 0...100)
                        .accentColor(.grayish)
                    Text("100")
                }.padding()
                
                Text("You have tried \(String(game.n)) times")
                
                Button("Confirm") {
                    checkResult = true
                    game.check(guess: Int(guess))
                }.padding()
                .alert(isPresented: $checkResult) {
                    Alert(
                        title: Text("Result"),
                        message: Text("\(game.msg)"),
                        dismissButton: .default(Text("OK")) {
                            if(game.checked){
                                guess = 0
                                game.startNewGame()
                                checkResult = false
                            }
                        }
                    )
                }
                .background(Color.grayish)
                .foregroundColor(.black)
                .cornerRadius(15)
                .padding(.bottom)
            }
            .background(Color.white)
            .cornerRadius(30)
            .padding(50)
            .font(
                .custom("AmericanTypewriter",fixedSize: 15)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
