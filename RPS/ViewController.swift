//
//  ViewController.swift
//  RPS
//
//  Created by Dmitrij Meidus on 07.05.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        resetBoard()
    }
    
    func resetBoard() {
            appSign.text = "🤖"
            statusOfTheGame.text = "Rock, Paper or Scissors?"
        fistedHandButton.isHidden = false
        fistedHandButton.isEnabled = true
        raisedHandButton.isHidden = false
        raisedHandButton.isEnabled = true
        victoryHandButton.isHidden = false
        victoryHandButton.isEnabled = true
        playAgainButton.isEnabled = true
        playAgainButton.isHidden = true
        }
    
    @IBOutlet weak var appSign: UILabel!
    @IBOutlet weak var statusOfTheGame: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    @IBOutlet weak var fistedHandButton: UIButton!
    @IBOutlet weak var raisedHandButton: UIButton!
    @IBOutlet weak var victoryHandButton: UIButton!
    
    @IBAction func fistedHand(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func raisedHand(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func victoryHand(_ sender: Any) {
        play(Sign.scissor)
    }
    
    @IBAction func playAgainButton(_ sender: Any) {
        resetBoard()
    }
    
    func play(_ playerTurn: Sign){
        fistedHandButton.isEnabled = false
        raisedHandButton.isEnabled = false
        victoryHandButton.isEnabled = false
    
    let opponent = randomSign()
    appSign.text = opponent.emoji
        
    let gameResult = playerTurn.opponentsTurn(opponent)
    
    
    switch gameResult {
            case.draw:
                statusOfTheGame.text = "It's a draw"
                view.backgroundColor = .yellow
            case.lose:
        statusOfTheGame.text = "Maybe Next Time"
                view.backgroundColor = .red
            case.win:
        statusOfTheGame.text = "You win"
                view.backgroundColor = .green
                
            case.start:
        statusOfTheGame.text = "Rock, Paper or Scissors"
            }
    
    switch playerTurn {
            case .rock:
                fistedHandButton.isHidden = false
        raisedHandButton.isHidden = true
        victoryHandButton.isHidden = true
            case.paper:
                fistedHandButton.isHidden = true
        raisedHandButton.isHidden = false
        victoryHandButton.isHidden = true
            case .scissor:
                fistedHandButton.isHidden = true
        raisedHandButton.isHidden = true
        victoryHandButton.isHidden = false
                
            
            }
            
            playAgainButton.isHidden = false
    }
    
}

