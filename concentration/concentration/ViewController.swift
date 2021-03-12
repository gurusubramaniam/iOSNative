//
//  ViewController.swift
//  concentration
//
//  Created by Sundararaman, ssubramaniam on 3/9/21.
//

import UIKit

class ViewController: UIViewController {
    // Concept: Variable observer
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    // outlet connection for cardButtons
    @IBOutlet var cardButtons: [UIButton]!
    
    // Used to calculate number of clicks, and display them in the label
    @IBOutlet weak var flipCountLabel: UILabel!
    
    // Making the display text to be data driven
    var emojiChoices = ["👻" , "🎃" , "👻" , "🎃"]
    
    // Click handler for the cardButtons.
    // When user clicks on the card Flipcount varibale is incremented.
    // find the index of the cardButtons and assing emojiChoices based on index.
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
         flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Choosen card is not in cardButtons")
        }
    }
 
    // Function which gets invoked from the action attached to the card.
    // Method checks if the currentTitke is equivalent to the senders emoji, if they match we flip the card and set the title of the card to be empty & change the backgroudnColor.
    // If they do not match then assign the title to emoji & set the background color to white, to give the effect of card flip
    func flipCard(withEmoji emoji: String, on button: UIButton){
        print("flipcard with emoji :\(emoji)")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

