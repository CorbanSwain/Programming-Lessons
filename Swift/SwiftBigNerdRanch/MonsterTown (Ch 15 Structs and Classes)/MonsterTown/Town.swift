//
//  Town.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

/// Class whose instances represent towns; towns that have streetlights and people!
struct Town {
    var population = 5_422
    var numberOfStopLights = 4
    
    /// Logs the town's population and number of stop lights
    /// to the console
    func printDescription() {
        print("Population: \(population), number of stoplights: \(numberOfStopLights)")
    }
    
    /// Changes the population size of the town by the amount passed
    ///
    /// - Parameter amount: value of type Int indicating
    ///             how much the town will change size
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
