//
//  Brewery.swift
//  Puppy Brew
//
//  Created by Aleksey Bykhun on 17.03.2018.
//  Copyright © 2018 caffeinum. All rights reserved.
//

import Foundation

typealias Temperature = Float

var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    return formatter
}()

enum CoffeeBeans: Int {
    case Brazil
    case Columbia
    case Salvador
    case Ethiopia
}

struct Brewery {
    var beans: CoffeeBeans = .Brazil
    var temp: Temperature = 90.0
    var time: TimeInterval = 4 * 60
    var date: Date = Date()
}

extension Brewery {
    func encode() -> [String: Double] {
        return [
            "date": date.timeIntervalSince1970,
            "temp": Double(temp),
            "time": time,
            "beans": Double(beans.hashValue)
        ]
    }

    init(dict: [String: Double]) {
        date = Date(timeIntervalSince1970: dict["date"]!)
        temp = Temperature(dict["temp"]!)
        time = dict["time"]!
        beans = CoffeeBeans.init(rawValue: Int(dict["beans"]!))!
    }
}
