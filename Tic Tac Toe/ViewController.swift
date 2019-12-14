//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Clicks Egypt on 11/29/19.
//  Copyright © 2019 Clicks Egypt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerImage: UIImageView!
    @IBOutlet weak var winningLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        activeGame = true
        
        activePlayer = 1
        
        gameState = [0,0,0,0,0,0,0,0,0]
        
        for i in 0..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
            winningLabel.isHidden = true
            winnerImage.isHidden = true
            playAgainButton.isHidden = true
            
            winningLabel.center = CGPoint(x: winningLabel.center.x - 500, y: winningLabel.center.y)
            winnerImage.center = CGPoint(x: winnerImage.center.x - 500, y: winnerImage.center.y)
            playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        }
    }
    //    nought = 1 and cross = 2
    var activeGame = true

    var activePlayer = 1

    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

    var gameState = [0,0,0,0,0,0,0,0,0] // 0 is empty, 1 is nought, 2 is cross
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        var activePosition = (sender as AnyObject).tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            
            gameState[activePosition] = activePlayer
            
            if activePlayer == 1 {
                
                (sender as AnyObject).setImage(UIImage(named: "nought.png"), for: [])

                activePlayer = 2
            } else{
                
                (sender as AnyObject).setImage(UIImage(named: "cross.png"), for: [])

                activePlayer = 1
            }
            
            for combination in winningCombinations {
                
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    
                    activeGame = false
                    
                    winningLabel.isHidden = false
                    
                    winnerImage.isHidden = false
                    
                    playAgainButton.isHidden = false
                    
                    if gameState[combination[0]] == 1 {
                        
                        winningLabel.text =
    "مبروووك ال (O) كسب ويويويويوي"
                        winnerImage.image = UIImage(named: "te7aa.jpg")
                    }
                    
                    else {
                        winningLabel.text =
                        "مبروووك ال (X) كسب ويويويويوي"
                        winnerImage.image = UIImage(named: "te7aa.jpg")
                    }
                    
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winningLabel.center = CGPoint(x: self.winningLabel.center.x + 500
                            , y: self.winningLabel.center.y)
                        
                        self.winnerImage.center = CGPoint(x: self.winnerImage.center.x + 500
                            , y: self.winnerImage.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500
                            , y: self.playAgainButton.center.y)
                    })
                    
                }
                    
//                    henaaaaaaaaaaaaaa
                /*else{
                    
                    activeGame = false
                    
                    winningLabel.isHidden = false
                    
                    winnerImage.isHidden = false
                    
                    playAgainButton.isHidden = false
                    
                    winningLabel.text = "Toz"
                    winnerImage.image = UIImage(named: "te7aa.jpg")
                    
                    UIView.animate(withDuration: 1, animations: {
                        
                        self.winningLabel.center = CGPoint(x: self.winningLabel.center.x + 500
                            , y: self.winningLabel.center.y)
                        
                        self.winnerImage.center = CGPoint(x: self.winnerImage.center.x + 500
                            , y: self.winnerImage.center.y)
                        
                        self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500
                            , y: self.playAgainButton.center.y)
                    })
                }*/
            }
        }
        else{
            print("feh moshkla ya 7maaar")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        winningLabel.isHidden = true
        winnerImage.isHidden = true
        playAgainButton.isHidden = true
        
        winningLabel.center = CGPoint(x: winningLabel.center.x - 500, y: winningLabel.center.y)
        winnerImage.center = CGPoint(x: winnerImage.center.x - 500, y: winnerImage.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
    }


}

