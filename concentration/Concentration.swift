//
//  Concentration.swift
//  concentration
//
//  Created by Alter Ego on 2/3/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0
    var score = 0;
    
    func chooseCard(at index: Int) {
    
        if index != indexOfOneAndOnlyFaceUpCard {
            flipCount += 1
        }

        // dont do anything to 'hidden' cards
        if !cards[index].isMatched {
            
            // if one card is already up
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                } else if cards[index].wasSeen {
                    score -= 1
                }
                
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
                
            // two cards are already up
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
                
            }
        }
        
        cards[index].wasSeen = true
    }
    
    func playTurn() {
        // choose first card
        
        // choose second card
        // if match, mark both as matched, and increase score by two
        
        // if no match, hide both cards and put both cards in seenCards
        // decrease score by one if first card was in seen cards
        
        // if no match, check to see if first card
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        cards.shuffle()
    }

}
