//
//  Zombie.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

/// `Monster` subclass that creates the walking dead
class Zombie: Monster {
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    /// `Bool` indicating if the instance of `Zombie` walks with a limp; true by default.
    var walksWithLimp = true
    
    private(set) var isFallingApart: Bool = false // visible only within the `Zombie` class
    
    override init() {
        super.init()
        type = MonsterType.ZOMBIE
    }
    
    /// Reduces the town's population by 10 (or down to zero if the population is less than 10) and calls the `Monster` class's `terrorizeTown()` function.
    final override func terrorizeTown() {
        if let t = town {
            let currentPop = t.population
            
            if !isFallingApart {
                if currentPop >= 10 {
                    town?.changePopulation(by: -10)
                } else if currentPop > 0 {
                    town?.changePopulation(by: -currentPop)
                }
            }
        }
        super.terrorizeTown()
    }
}
