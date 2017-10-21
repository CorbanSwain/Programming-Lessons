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
    /// `Optional` instance of the `Town` struct
    var town: Town?
    /// Name of the instance of `Monster`. "Monster" by default
    var name = "Monster"
    
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
