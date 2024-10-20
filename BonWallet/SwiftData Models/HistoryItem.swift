//
//  HistoryItem.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/20/24.
//

import SwiftData
import Foundation

@Model
class HistoryItem {
    @Attribute(.unique) var id: UUID
    var time: Date
    var name: String
    var serviceType: String
    var serviceName: String
    var pointMultiplier: Double
    
    // Default initializer for SwiftData
    init(id: UUID = UUID(), name: String, serviceType: String, serviceName: String, pointMultiplier: Double = 2) {
        self.id = id
        self.time = Date()
        self.name = name
        self.serviceType = serviceType
        self.serviceName = serviceName
        self.pointMultiplier = pointMultiplier
    }
}
