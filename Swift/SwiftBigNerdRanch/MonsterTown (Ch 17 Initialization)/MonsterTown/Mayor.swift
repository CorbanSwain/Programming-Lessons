//
//  Mayor.swift
//  MonsterTown
//
//  Created by Corban Swain on 1/10/17.
//  Copyright © 2017 BigNerdRanch. All rights reserved.
//

import Foundation

struct Mayor {
    
    var lastKnownPop: Int = 0 {
        didSet(oldPop) {
            if (oldPop > lastKnownPop) {
                sendCondolences()
            }
        }
    }
    
    func sendCondolences() {
        print("I'm deeply saddened to hear about this latest tragedy...")
    }
    
    private var anxietyLevel = 0
    
    mutating func notifyAttack(by monster: MonsterType) {
        if (monster == MonsterType.ZOMBIE)
        {
            anxietyLevel += 1
            print("Anxiety Level: \(anxietyLevel)")
        }
    }
    
}
