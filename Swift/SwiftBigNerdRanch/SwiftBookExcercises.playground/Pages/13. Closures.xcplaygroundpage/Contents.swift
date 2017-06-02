//: [Previous](@previous)

import Cocoa

var volunteerCounts = [1,3,40,32,2,53,77,13]

let volunteerSorted = volunteerCounts.sorted {$0 < $1}
volunteerSorted

func makeTownGrand(withBudget budget: Int,
                   condition: (Int) -> Bool) -> ((Int,Int) -> Int)? {
    if condition(budget) {
        func buildRoads(byAddingLights lights: Int,
                        toExistingLights existingLights: Int) -> Int {
            return lights + existingLights
        }
        return buildRoads
    } else {
        return nil
    }
}
func evaluate(budget: Int) -> Bool {
    return budget > 10_000
}

var stoplights = 4

if let townPlanByAddingLightsToExistingLights =
    makeTownGrand(withBudget: 1_000, condition: evaluate) {
    
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}
if let townPlanByAddingLightsToExistingLights =
    makeTownGrand(withBudget: 10_500, condition: evaluate) {
    
    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
}
print("Knowhere has \(stoplights) stoplights.")

func makePopulationTracker(forInitialPopulation population: Int) -> ((Int) -> Int) {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
currentPopulation = growBy(500) // Total population is now 7422
let anotherGrowBy = growBy
anotherGrowBy(500) // totalPopulation is now equal to 7922

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)

growBy(0)


// Functional Programming Functions map(_:), filter(_:), and reduce(_:_:)

let precinctPopulations = [1244, 2021, 2157]
let projectedPopulations = precinctPopulations.map {
    (population: Int) -> Int in
    return population * 2
}
projectedPopulations

let bigProjections = projectedPopulations.filter {
    (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections

let totalProjection = projectedPopulations.reduce(0) {
    (accumulatedProjection: Int, precinctProjection: Int) -> Int in
    return accumulatedProjection + precinctProjection
}

// Bronze Challenge 1

let originalVolCounts = volunteerCounts
volunteerCounts.sort { (current, next) in current < next }
volunteerCounts

// Bronze Challenge 2

volunteerCounts = originalVolCounts
volunteerCounts.sort(by: <) // Ascending shorthand

volunteerCounts = originalVolCounts
volunteerCounts.sort() // Ascending sort by default

// Gold Challenge

let precinctPopulations2 = [1244, 2021, 2157]
let projectedPopulations2 = precinctPopulations2.map {$0 * 2}
projectedPopulations2 == projectedPopulations

let bigProjections2 = projectedPopulations2.filter {$0 > 4000}
bigProjections2 == bigProjections

let totalProjection2 = projectedPopulations2.reduce(0) {$0 + $1}
totalProjection2 == totalProjection



//: [Next](@next)
