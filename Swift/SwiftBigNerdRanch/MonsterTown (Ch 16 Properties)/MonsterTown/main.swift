//
//  main.swift
//  MonsterTown
//
//  Created by Corban Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

var myTown = Town()
let myTownSize = myTown.townSize
print(myTownSize)
myTown.changePopulation(by: Int(1e6))
print("Size: \(myTown.townSize); population: \(myTown.population)")
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.town?.printDescription()
fredTheZombie.terrorizeTown()
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

print("Victim Pool: \(fredTheZombie.victimPool)")
fredTheZombie.victimPool = 500
print("Victim Pool: \(fredTheZombie.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
