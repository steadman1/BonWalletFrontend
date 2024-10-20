//
//  CreditCard.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftData
import Foundation

struct PointMultiplier: Codable, Equatable {
    var multiplier: Int
    var description: String
}

struct ServiceMultiplier: Codable, Equatable  {
    var serviceName: String
    var multiplier: Int
    var description: String
}

struct Benefit: Codable, Equatable {
    var title: String
    var description: String
}

@Model
class CreditCard {
    @Attribute(.unique) var id: Int
    var name: String
    var imagePath: String
    var pointMultipliers: [PointMultiplier]
    var serviceMultipliers: [ServiceMultiplier]
    var benefits: [Benefit]
    
    // Default initializer for SwiftData
    init(id: Int, name: String, imagePath: String, pointMultipliers: [PointMultiplier], serviceMultipliers: [ServiceMultiplier], benefits: [Benefit]) {
        
        self.id = id
        self.name = name
        self.imagePath = imagePath
        self.pointMultipliers = pointMultipliers
        self.serviceMultipliers = serviceMultipliers
        self.benefits = benefits
    }
    
    // Static examples of CreditCard objects
    static let all: [CreditCard] = [
        .bevy,
        .brilliant,
        .business,
        .bold,
        .boundless,
        .bountiful
    ]
    
    // Amex Bevy
    static let bevy = CreditCard(
        id: 0,
        name: "Amex Bevy",
        imagePath: "bonvoy-amex-bevy",
        pointMultipliers: [
            PointMultiplier(multiplier: 6, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 4, description: "For each dollar of eligible purchases at restaurants and supermarkets."),
            PointMultiplier(multiplier: 2, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Uber", multiplier: 2, description: "For each dollar spent on Uber services."),
            ServiceMultiplier(serviceName: "Starbucks", multiplier: 100, description: "For making qualifying purchases at Starbucks during Marriott Bonvoy weeks.")
        ],
        benefits: [
            Benefit(title: "$250 Dining Credit", description: "Each year, receive $250 in dining credits for eligible purchases."),
            Benefit(title: "Elite Night Credits", description: "Receive 15 Elite Night Credits toward the next Marriott Bonvoy status.")
        ]
    )

    // Amex Brilliant
    static let brilliant = CreditCard(
        id: 1,
        name: "Amex Brilliant",
        imagePath: "bonvoy-amex-brilliant",
        pointMultipliers: [
            PointMultiplier(multiplier: 6, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 3, description: "For each dollar of eligible purchases at restaurants and on flights booked directly with airlines."),
            PointMultiplier(multiplier: 2, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Uber", multiplier: 2, description: "For each dollar spent on Uber Eats and grocery orders of $40+ delivered to Marriott hotels."),
            ServiceMultiplier(serviceName: "Starbucks", multiplier: 4, description: "For making three qualifying purchases at Starbucks during Marriott Bonvoy Week.")
        ],
        benefits: [
            Benefit(title: "$300 Brilliant Dining Credit", description: "Each calendar year, get up to $300 (up to $25 per month) in statement credits for eligible purchases made on the Marriott Bonvoy Brilliant® American Express® Card at restaurants worldwide."),
            Benefit(title: "Complimentary Marriott Bonvoy Platinum Status", description: "Earn up to 5X points from Marriott Bonvoy® on eligible hotel purchases.")
        ]
    )

    // Amex Business
    static let business = CreditCard(
        id: 2,
        name: "Amex Business",
        imagePath: "bonvoy-cobrand-amex-business",
        pointMultipliers: [
            PointMultiplier(multiplier: 6, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 4, description: "For each dollar on dining, gas stations, wireless phone services, and shipping."),
            PointMultiplier(multiplier: 2, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Uber", multiplier: 3, description: "For each dollar spent on Uber services."),
            ServiceMultiplier(serviceName: "Starbucks", multiplier: 50, description: "For making qualifying purchases at Starbucks during Marriott Bonvoy promotions.")
        ],
        benefits: [
            Benefit(title: "$100 Airline Fee Credit", description: "Receive $100 in airline fee credits per year."),
            Benefit(title: "Elite Night Credits", description: "Get 15 Elite Night Credits toward Marriott Bonvoy status.")
        ]
    )

    // Chase Bold
    static let bold = CreditCard(
        id: 3,
        name: "Chase Bold",
        imagePath: "Marriott Bonvoy Bold Card",
        pointMultipliers: [
            PointMultiplier(multiplier: 3, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 2, description: "For each dollar on other travel purchases."),
            PointMultiplier(multiplier: 1, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Lyft", multiplier: 5, description: "For each dollar spent on Lyft rides."),
            ServiceMultiplier(serviceName: "Uber", multiplier: 2, description: "For each dollar spent on Uber Eats.")
        ],
        benefits: [
            Benefit(title: "No Annual Fee", description: "Enjoy no annual fee on the Marriott Bonvoy Bold® Credit Card."),
            Benefit(title: "Complimentary Silver Elite Status", description: "Receive complimentary Silver Elite status in Marriott Bonvoy.")
        ]
    )

    // Chase Boundless
    static let boundless = CreditCard(
        id: 4,
        name: "Chase Boundless",
        imagePath: "Marriott Bonvoy Boundless Card",
        pointMultipliers: [
            PointMultiplier(multiplier: 6, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 3, description: "For each dollar on dining, groceries, and gas."),
            PointMultiplier(multiplier: 2, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Lyft", multiplier: 5, description: "For each dollar spent on Lyft rides."),
            ServiceMultiplier(serviceName: "Uber", multiplier: 2, description: "For each dollar spent on Uber Eats.")
        ],
        benefits: [
            Benefit(title: "Free Night Award", description: "Receive a Free Night Award every year after your account anniversary."),
            Benefit(title: "15 Elite Night Credits", description: "Get 15 Elite Night Credits toward your Marriott Bonvoy status.")
        ]
    )

    // Chase Bountiful
    static let bountiful = CreditCard(
        id: 5,
        name: "Chase Bountiful",
        imagePath: "Marriott Bonvoy Bountiful Card",
        pointMultipliers: [
            PointMultiplier(multiplier: 6, description: "For each dollar of eligible purchases at hotels participating in Marriott Bonvoy."),
            PointMultiplier(multiplier: 4, description: "For each dollar on dining and travel purchases."),
            PointMultiplier(multiplier: 2, description: "For each dollar on all other eligible purchases.")
        ],
        serviceMultipliers: [
            ServiceMultiplier(serviceName: "Uber", multiplier: 3, description: "For each dollar spent on Uber services."),
            ServiceMultiplier(serviceName: "Lyft", multiplier: 4, description: "For each dollar spent on Lyft rides.")
        ],
        benefits: [
            Benefit(title: "$250 Dining Credit", description: "Receive $250 in dining credits each year."),
            Benefit(title: "Complimentary Gold Elite Status", description: "Enjoy Gold Elite status with your Marriott Bonvoy Bountiful Card.")
        ]
    )
}
