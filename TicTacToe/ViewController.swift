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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: Public functions
    func playGame(buttonSelected:UIButton) {
        if activePlayer == 1 {
            buttonSelected.setTitle("X", for: UIControlState.normal)
            activePlayer = 2
        } else {
            buttonSelected.setTitle("O", for: UIControlState.normal)
            activePlayer = 1
        }
    }
   
    //MARK: Actions
    @IBAction func buttonSelectEvent(_ sender: Any) {
        let buttonSelected = sender as! UIButton
        playGame(buttonSelected: buttonSelected)
    }


}

