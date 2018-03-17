//
//  BrewController.swift
//  Puppy Brew
//
//  Created by Aleksey Bykhun on 17.03.2018.
//  Copyright © 2018 caffeinum. All rights reserved.
//

import Foundation

class BrewController {
    var storage: UserDefaults
    private var brews: [Brewery]

    init(storage: UserDefaults = .standard) {
        self.storage = storage

        brews = BrewController.load(from: storage)

        if brews.isEmpty {
            fillTestData()
        }
    }

    private static func load(from storage: UserDefaults) -> [Brewery] {
        let brewsArray = storage.array(forKey: "brews") ?? []
        print("userdefaults stores brews", brewsArray)
        let brews = brewsArray.map { dict in Brewery(dict: dict as! [String: Double]) }
        print("load storage: brews", brews)
        return brews
    }

    func store(brew: Brewery) {
        print("saving new item", brew)
        print("into brews:", brews)
        brews += [brew]
        storage.set(brews.map { $0.encode() }, forKey: "brews")
    }

    func reload() -> [Brewery]{
        brews = BrewController.load(from: storage)
        return brews
    }


    func get() -> [Brewery] {
        print("get brews:", brews)
        return brews
    }
}

extension BrewController {
    func fillTestData() {
        store(brew: Brewery())
        store(brew: Brewery(beans: .Columbia, temp: 100, time: 3 * 60, date: Date()))
        store(brew: Brewery(beans: .Salvador, temp: 80, time: 22, date: Date()))
    }
}
