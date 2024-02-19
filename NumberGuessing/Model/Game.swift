//
//  Game.swift
//  NumberGuessing
//
//  Created by Babypowder on 27/1/2567 BE.
//

import Foundation

struct Game {
    var target = Game.random()
    var n = 0
    var msg = ""
    var checked = false
    
    static func random() -> Int {
        let rand = Int.random(in: 0...100)
        return rand
    }
    
    mutating func check(guess: Int) {
        if(guess > target){
            msg = "Target is lower than \(guess)."
            n += 1
        }
        else if(guess < target){
            msg = "Taeget is greater than \(guess)."
            n += 1
        }
        else{
            msg = "Congratulations! You have tried \(n) times."
            checked = true
        }
    }
    
    mutating func startNewGame() {
        target = Game.random()
        n = 0
        checked = false
    }
}
