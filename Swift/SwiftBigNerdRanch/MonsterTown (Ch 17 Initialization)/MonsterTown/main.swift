//
//  main.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

var myTown = Town(population: 0,
                  stoplights: 6)
myTown?.printDescription()
let myTownSize = myTown?.townSize
print(String(describing: myTownSize))
myTown?.changePopulation(by: Int(1e6))
print("Size: \(myTown?.townSize); population: \(myTown?.population)")
var fredTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Fred")
fredTheZombie?.town?.printDescription()
fredTheZombie?.terrorizeTown()
fredTheZombie?.terrorizeTown()
fredTheZombie?.town?.printDescription()

var convenientZombie = Zombie(limp: true, fallingApart: false)

print("Victim Pool: \(String(describing: fredTheZombie?.victimPool))")
fredTheZombie?.victimPool = 500
print("Victim Pool: \(String(describing: fredTheZombie?.victimPool))")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
fredTheZombie = nil
