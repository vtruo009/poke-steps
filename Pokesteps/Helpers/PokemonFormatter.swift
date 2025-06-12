//
//  PokemonFormatter.swift
//  Pokesteps
//
//  Created by Van Truong on 6/11/25.
//

import Foundation

struct PokemonFormatter {
    static func formattedHeight(_ decimeters: Int) -> String {
        let meters = Double(decimeters) * 0.1
        let totalInches = meters * 39.3701
        let feet = Int(totalInches / 12)
        let inches = Int(totalInches.truncatingRemainder(dividingBy: 12))
        return String("\(feet)'\(inches)\"")
    }
    
    static func formattedWeight(_ hectograms: Int) -> String {
        let kg = Double(hectograms) * 0.1
        let pounds = kg * 2.20462
        return String(format: "%.2f lbs", pounds)
    }
    
    static func formattedID(_ id: Int) -> String {
        return String(format: "#%04d", id)
    }
}
