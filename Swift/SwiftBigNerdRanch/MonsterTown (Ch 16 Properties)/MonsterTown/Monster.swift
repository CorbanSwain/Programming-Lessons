//
//  Monster.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

/// Creates Monsters that can terrorize towns among other things

public enum MonsterType: String {
    case GENERAL
    case ZOMBIE
    case VAMPIRE
}

class Monster {
    
    
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr"
    }
    
    var type = MonsterType.GENERAL
    
    /// `Optional` instance of the `Town` struct
    var town: Town?
    
    /// Name of the instance of `Monster`. "Monster" by default
    var name = "Monster"
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    
    /// Logs the status of the monster's action to the standard output
    ///
    /// - returns: Void
    
    
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
            town?.monsterAttack(by: type);
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
