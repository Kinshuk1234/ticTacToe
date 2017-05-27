//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kinshuk Singh on 2017-05-26.
//  Copyright © 2017 Ksk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    
    @IBAction func playButton(_ sender: Any) {
        
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        count = 0
        
        
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x:  winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
        
    }
    
    
    ////////////////////////////////////////////////////////////////////////////
    
    var activeGame = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] // 0 - empty, 1 - noughts, 2 - crosses
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var count = 0
    
    ////////////////////////////////////////////////////////////////////////////
    
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            count += 1
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }
            else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
            
            for combinations in winningCombinations {
                
                if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] &&
                    gameState[combinations[1]] == gameState[combinations[2]] {
                    
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    
                    
                    if gameState[combinations[0]] == 1 {
                        winnerLabel.text = "Noughts have won!"
                    }
                    else {
                        winnerLabel.text = "Crosses have won!"
                    }
                    
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y)
                    })
                }
            }
        }
        else if count > 8 {
                    activeGame = false
                    winnerLabel.isHidden = false
                    playAgain.isHidden = false
                    winnerLabel.text = "That was a tie!"
                    UIView.animate(withDuration: 1, animations: {
                        self.winnerLabel.center = CGPoint(x: self.winnerLabel.center.x + 500, y: self.winnerLabel.center.y)
                        self.playAgain.center = CGPoint(x: self.playAgain.center.x + 500, y: self.playAgain.center.y)
                    })
            }
        
    }
    ////////////////////////////////////////////////////////////////////////////
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winnerLabel.isHidden = true
        playAgain.isHidden = true
        
        winnerLabel.center = CGPoint(x:  winnerLabel.center.x - 500, y: winnerLabel.center.y)
        playAgain.center = CGPoint(x: playAgain.center.x - 500, y: playAgain.center.y)
        
    }
    ////////////////////////////////////////////////////////////////////////////
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

