//
//  Sign.swift
//  RPS
//
//  Created by Dmitrij Meidus on 07.05.22.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissor
    }
}

enum Sign {
    case rock, scissor, paper
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .scissor: return "✌️"
        case .paper: return "🖐"
        }
    }
    func opponentsTurn(_ opponent: Sign) -> GameState {
           switch self {
           case .rock:
               switch opponent {
               case .rock:
                    return GameState.draw
               case .paper:
                    return GameState.lose
               case .scissor:
                    return GameState.win
               }
           case .scissor:
               switch opponent {
               case .rock:
                    return GameState.lose
               case .paper:
                    return GameState.win
               case .scissor:
                    return GameState.draw
               }
           case .paper:
               switch opponent {
               case .rock:
                    return GameState.win
               case .paper:
                    return GameState.draw
               case .scissor:
                    return GameState.lose
               }
           }
    }
}
