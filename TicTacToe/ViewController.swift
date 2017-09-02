//
//  ViewController.swift
//  TicTacToe
//
//  Created by Raul  Canul on 02/09/17.
//  Copyright © 2017 Raul  Canul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    
    //MARK: Properties
    var activePlayer = 1
    var firstPlayer = [Int]()
    var secondPlayer = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Public functions
    func resetGame(){
        button1.setTitle( "", for: UIControlState.normal)
        button1.isEnabled = true
        
        button2.setTitle( "", for: UIControlState.normal)
        button2.isEnabled = true
        
        button3.setTitle( "", for: UIControlState.normal)
        button3.isEnabled = true
        
        button4.setTitle( "", for: UIControlState.normal)
        button4.isEnabled = true
        
        button5.setTitle( "", for: UIControlState.normal)
        button5.isEnabled = true
        
        button6.setTitle( "", for: UIControlState.normal)
        button6.isEnabled = true
        
        button7.setTitle( "", for: UIControlState.normal)
        button7.isEnabled = true
        
        button8.setTitle( "", for: UIControlState.normal)
        button8.isEnabled = true
        
        button9.setTitle( "", for: UIControlState.normal)
        button9.isEnabled = true
        
        activePlayer = 1
        firstPlayer = [Int]()
        secondPlayer = [Int]()
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
        
        if winner != -1 {
            var msg = ""
            
            if winner == 1 {
                msg = " Player 1 is winner!"
            } else {
                msg = " Player 2 is winner!"
            }
            
            //Show alert
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.default, handler: nil))
            
            resetGame()
            self.present(alert, animated: true, completion: resetGame)
            
        }
    }
    
    
    func playGame(buttonSelected:UIButton) {
        if activePlayer == 1 {
            buttonSelected.setTitle("X", for: UIControlState.normal)
            
            firstPlayer.append(Int(buttonSelected.tag))
            activePlayer = 2
            autoPlay()
        } else {
            buttonSelected.setTitle("O", for: UIControlState.normal)
            
            secondPlayer.append(Int(buttonSelected.tag))
            activePlayer = 1
        }
        
        findWinner()
        buttonSelected.isEnabled = false
    }
    
    func autoPlay() {
        //scan empty cells
        var emptyCells = [Int]()
        
        for index in 1...9 {
            if !(firstPlayer.contains(index) || secondPlayer.contains(index)) {
                emptyCells.append(index)
            }
        }
        
        let runIndex =  arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(runIndex)]
        let butotnSelected:UIButton?
        
        switch cellID {
        case 1:
            butotnSelected = button1
        
        case 2:
            butotnSelected = button2
            
        case 3:
            butotnSelected = button3
            
        case 4:
            butotnSelected = button4
            
        case 5:
            butotnSelected = button5
            
        case 6:
            butotnSelected = button6
            
        case 7:
            butotnSelected = button7
        
        case 8:
            butotnSelected = button8
            
        case 9:
            butotnSelected = button9
            
        default:
            butotnSelected = button1
        }
        
        playGame(buttonSelected: butotnSelected!)
    }
   
    //MARK: Actions
    @IBAction func buttonSelectEvent(_ sender: Any) {
        let buttonSelected = sender as! UIButton
        playGame(buttonSelected: buttonSelected)
    }


}

