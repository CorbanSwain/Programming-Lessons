//
//  Vampire.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

/// `Monster` subclass that deal minimal damage to the population. Watch out for the growing Vampire Thrall
class Vampire: Monster {
    
    /// An array of `Vambire` objects that grows with each call to `Vampire.terrorizeTown()`
    var vampireThrall: [Vampire] = []
    
    /// Decrements the town's population by one and adds the `Vampire` instance that called `terrorizeTown()` to the `vampireThrall: [Vampire]` array. Also calls the `Monster` class's `terrorizeTown()` function.
    /// - SeeAlso: `Monster.terrorizeTown()`
    override func terrorizeTown() {
        vampireThrall.append(self)
        
        if let t = town, t.population > 0 {
            town?.changePopulation(by: -1)
        }
        
        super.terrorizeTown()
    }
}
