//
//  Order.swift
//  Sweet tooth
//
//  Created by Parth Antala on 2024-07-11.
//

import Foundation


@Observable
class Order: Codable {
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quatity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quatity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        } else {
            return true
        }
    }
    
    var cost: Decimal {
        var baseCost = Decimal(quatity) * 2
        baseCost += Decimal(type) / 2
        
        if extraFrosting {
            baseCost += Decimal(quatity)
        }
        if addSprinkles {
            baseCost += Decimal(quatity) / 2
        }
        
        return baseCost
    }
    
}
