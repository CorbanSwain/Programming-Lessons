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
    /// `Bool` indicating if the instance of `Zombie` walks with a limp; true by default.
    var walksWithLimp = true

    
    /// Reduces the town's population by 10 (or down to zero if the population is less than 10) and calls the `Monster` class's `terrorizeTown()` function.
    final override func terrorizeTown() {
        
        if let t = town {
            let currentPop = t.population
            
            if currentPop >= 10 {
                town?.changePopulation(by: -10)
            } else if currentPop < 10 && currentPop > 0 {
                town?.changePopulation(by: -currentPop)
            }
        }
        super.terrorizeTown()
    }
}
