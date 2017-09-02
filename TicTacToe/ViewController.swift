//
//  ViewController.swift
//  TicTacToe
//
//  Created by Raul  Canul on 02/09/17.
//  Copyright © 2017 Raul  Canul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    var activePlayer = 1
    var firstPlayer = [Int]()
    var secondPlayer = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func findWinner() {
        var winner = -1
        
        //first row
        if (firstPlayer.contains(1) && firstPlayer.contains(2) && firstPlayer.contains(3) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(1) && secondPlayer.contains(2) && secondPlayer.contains(3) ) {
            winner = 2
        }
        
        //second row
        if (firstPlayer.contains(4) && firstPlayer.contains(5) && firstPlayer.contains(6) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(4) && secondPlayer.contains(5) && secondPlayer.contains(6) ) {
            winner = 2
        }
        
        //third row
        if (firstPlayer.contains(7) && firstPlayer.contains(8) && firstPlayer.contains(9) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(7) && secondPlayer.contains(8) && secondPlayer.contains(9) ) {
            winner = 2
        }
        
        //first column
        if (firstPlayer.contains(1) && firstPlayer.contains(4) && firstPlayer.contains(7) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(1) && secondPlayer.contains(4) && secondPlayer.contains(7) ) {
            winner = 2
        }
        
        //first column
        if (firstPlayer.contains(2) && firstPlayer.contains(5) && firstPlayer.contains(8) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(2) && secondPlayer.contains(5) && secondPlayer.contains(8) ) {
            winner = 2
        }
        
        //third column
        if (firstPlayer.contains(3) && firstPlayer.contains(6) && firstPlayer.contains(9) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(3) && secondPlayer.contains(6) && secondPlayer.contains(9) ) {
            winner = 2
        }
        
        //diagonal 1
        if (firstPlayer.contains(1) && firstPlayer.contains(5) && firstPlayer.contains(9) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(1) && secondPlayer.contains(5) && secondPlayer.contains(9) ) {
            winner = 2
        }
        
        //diagonal 2
        if (firstPlayer.contains(1) && firstPlayer.contains(5) && firstPlayer.contains(9) ) {
            winner = 1
        }
        
        if (secondPlayer.contains(3) && secondPlayer.contains(5) && secondPlayer.contains(7) ) {
            winner = 2
        }
    }
    
    //MARK: Public functions
    func playGame(buttonSelected:UIButton) {
        if activePlayer == 1 {
            buttonSelected.setTitle("X", for: UIControlState.normal)
            
            firstPlayer.append(Int(buttonSelected.tag))
            activePlayer = 2
        } else {
            buttonSelected.setTitle("O", for: UIControlState.normal)
            
            secondPlayer.append(Int(buttonSelected.tag))
            activePlayer = 1
        }
        
        buttonSelected.isEnabled = false
    }
   
    //MARK: Actions
    @IBAction func buttonSelectEvent(_ sender: Any) {
        let buttonSelected = sender as! UIButton
        playGame(buttonSelected: buttonSelected)
    }


}

