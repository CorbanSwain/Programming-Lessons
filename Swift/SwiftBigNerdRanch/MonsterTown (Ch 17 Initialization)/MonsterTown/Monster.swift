//
//  Monster.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

/// Creates Monsters that can terrorize towns among other things

class Monster {
    
    
    static let isTerrifying = true
    class var spookyNoise: String {
        return "Grrr"
    }
    
    /// `Optional` instance of the `Town` struct
    var town: Town?
    
    /// Name of the instance of `Monster`. "Monster" by default
    var name:String
    
    var victimPool: Int {
        get {
            return town?.population ?? 0
        }
        set(newVictimPool) {
            town?.population = newVictimPool
        }
    }
    required init?(town: Town?, monsterName: String) {
        guard !monsterName.isEmpty else {
            return nil
        }
        
        self.town = town
        name = monsterName
    }
    
    /// Logs the status of the monster's action to the standard output
    ///
    /// - returns: Void
    func terrorizeTown() {
        if town != nil {
            print("\(name) is terrorizing a town!")
        } else {
            print("\(name) hasn't found a town to terrorize yet...")
        }
    }
}
