//
//  main.swift
//  MonsterTown
//
//  Created by Corban N. Swain on 12/28/16.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Foundation

var myTown = Town()
print("Zombie Territory")
myTown.changePopulation(by: +500)
let fredTheZombie = Zombie()
fredTheZombie.town = myTown
fredTheZombie.town?.population = 9
fredTheZombie.town?.printDescription()
fredTheZombie.terrorizeTown()
fredTheZombie.town?.printDescription()

print("\n\nVampire Territory")
let newVampire = Vampire()
newVampire.town = myTown
//newVampire.town?.population = 0
newVampire.town?.printDescription()
newVampire.terrorizeTown()
newVampire.town?.printDescription()
