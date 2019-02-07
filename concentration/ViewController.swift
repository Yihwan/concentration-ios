//
//  ViewController.swift
//  concentration
//
//  Created by Yihwan Kim on 2/2/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)

    lazy var emojiChoices: [String]! = Array(emojiThemes.values).randomElement()
    
    var emojiThemes = [
        "faces": ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣"],
        "places": ["🏯", "🗿", "🗽", "🗼", "🏰", "🎢", "⛰", "⛺️"],
        "foods": ["🥗", "🍱", "🌰", "🍩", "🍭", "🍝", "🍕", "🌮"],
        "drinks": ["🥛", "🍼", "🥤", "🥃", "🍷", "🥂", "🍻", "🍹"],
        "objects": ["📱", "🎛", "📡", "🛢", "💎", "🧯", "🧰", "🧲"],
        "flags": ["🏳️", "🏴", "🏴‍☠️", "🏁", "🚩", "🏳️‍🌈", "🇺🇳", "🇦🇫"],
        "activities": ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🎾", "🏐", "🏉"]
    ]

    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Not found")
        }
    }
    
    @IBAction func touchNewGame(_ sender: UIButton) {
        game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
        emojiChoices = Array(emojiThemes.values).randomElement()
        
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5771305561, blue: 0.4654303789, alpha: 0.1025528169) : #colorLiteral(red: 1, green: 0.5771305561, blue: 0.4654303789, alpha: 1)
            }
        }
        
        updateFlipCount(game.flipCount)
        updateScore(game.score)
    }
    
    func updateFlipCount(_ flipCount: Int) {
        flipCountLabel.text = "Flips: \(flipCount)"
    }
    
    func updateScore(_ score: Int) {
        scoreLabel.text = "Score: \(score)"
    }
    
    var emojis = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emojis[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emojis[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emojis[card.identifier] ?? "Not found"
    }
}

