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
    let region: String
    
    var population: Int {
        didSet(oldPopulation) {
            if oldPopulation > population {
                print("The population has decreased to \(population) from \(oldPopulation).")
            }
        }
    }
    
    var numberOfStopLights: Int
    
    init?(region: String, population: Int, stoplights: Int) {
        guard population > 0 else {
            return nil
        }
        
        self.region = region
        self.population = population
        numberOfStopLights = stoplights
    }
    
    init?(population: Int, stoplights: Int) {
        self.init(region: "N/A", population: population, stoplights: stoplights)
    }
    
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
        print("Population: \(population); number of stoplights: \(numberOfStopLights); region: \(region)")
    }
    
    /// Changes the population size of the town by the amount passed
    ///
    /// - Parameter amount: value of type Int indicating
    ///             how much the town will change size
    mutating func changePopulation(by amount: Int) {
        population += amount
    }
    
}
