//
//  Activity.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 23/06/22.
//

import Foundation

struct Activity: Codable {
    let activity, type: String
    let participants: Int
    let price: Double
    let link, key: String
    let accessibility: Double
    
    var priceRate: String {
       switch price {
       case let x where x == 0.00:
           return "Free"
       case let x where x <= 0.30:
           return "Low"
       case let x where x <= 0.60:
           return "Medium"
       default:
           return "High"
       }
   }
}
