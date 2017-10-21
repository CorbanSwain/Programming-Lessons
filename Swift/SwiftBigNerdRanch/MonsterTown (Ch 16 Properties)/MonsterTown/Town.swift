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
    static let region = "South"
    
    var population = 5_422 {
        didSet(oldPopulation) {
            if oldPopulation > population {
                print("The population has decreased to \(population) from \(oldPopulation).")
            }
            townMayor.lastKnownPop = population
        }
    }
    
    var numberOfStopLights = 4
    
    var townMayor: Mayor = Mayor()
    
    enum Size {
        case small
        case medium
        case large
    }
    
    var townSize: Size {
        get {
            switch self.population {
            case 0...10_000:
                return Size.small
                
            case 10_001...100_000:
                return Size.medium
                
            default:
                return Size.large
            }
        }
    }
    
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
    
    mutating func monsterAttack(by monster: MonsterType) {
        townMayor.notifyAttack(by: monster)
    }
    
}
