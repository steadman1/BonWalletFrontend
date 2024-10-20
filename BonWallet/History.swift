//
//  History.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/20/24.
//

import SwiftUI
import SwiftData
import SpenceKit

struct History: View {
    @Environment(\.modelContext) var context
    
    @Query var historyItems: [HistoryItem]
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                (
                    Text("Reward & Benefit\nNotifications")
                        .font(.SpenceKit.SerifLargeTitleFont)
                    + Text(" (\(historyItems.count))")
                        .font(.SpenceKit.SerifTertiaryTitleFont)
                ).serifBold(font: .SerifLargeTitle)
                
                Spacer()
                
                IconButton(.tertiary) {
                    let newItem = HistoryItem(
                        id: UUID(),
                        name: "Uber",
                        serviceType: "App",
                        serviceName: "Uber",
                        pointMultiplier: 6
                    )
                    context.insert(newItem)
                    try? context.save()
                } label: {
                    Image(systemName: "info")
                        .fontWeight(.bold)
                }
            }
            
            if historyItems.count > 0 {
                VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing4) {
                    Text("Active Marriott Rewards Offers")
                        .font(.SpenceKit.SansSubheadFont)
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                    HistoryItemView(historyItem: historyItems[0], isActive: true)
                }
                
                Spacer().frame(height: SpenceKit.Constants.spacing16)
                
                VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing4) {
                    Text("History")
                        .font(.SpenceKit.SansSubheadFont)
                        .foregroundStyle(Color.SpenceKit.TertiaryText)
                    ForEach(Array(zip(historyItems.indices, historyItems)), id: \.0) { index, historyItem in
                        if index > 0 {
                            HistoryItemView(historyItem: historyItem, isActive: false)
                        }
                    }
                }
            } else {
                VStack(spacing: SpenceKit.Constants.spacing4) {
                    Text("No Notifications yet")
                        .font(.SpenceKit.SansHeadlineFont)
                    Text("Notifications will appear here when you're\nnear a Marriott Rewards location.")
                        .font(.SpenceKit.SansSubheadFont)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                }.frame(height: 200)
            }
        }.padding(.horizontal, SpenceKit.Constants.padding16)
            .onAppear {
                if historyItems.count == 0 {
                    let newItem0 = HistoryItem(
                        id: UUID(),
                        name: "Uber",
                        serviceType: "App",
                        serviceName: "Uber",
                        pointMultiplier: 6
                    )
                    context.insert(newItem0)
                    
                    let newItem1 = HistoryItem(
                        id: UUID(),
                        name: "Starbucks",
                        serviceType: "App",
                        serviceName: "Starbucks",
                        pointMultiplier: 4
                    )
                    context.insert(newItem1)
                    
                    let newItem2 = HistoryItem(
                        id: UUID(),
                        name: "Marriott Belagio",
                        serviceType: "Location",
                        serviceName: "lodging",
                        pointMultiplier: 17
                    )
                    context.insert(newItem2)
                    
                    let newItem3 = HistoryItem(
                        id: UUID(),
                        name: "Exxon Mobile",
                        serviceType: "Location",
                        serviceName: "gas_station",
                        pointMultiplier: 2
                    )
                    context.insert(newItem3)
                    
                    let newItem4 = HistoryItem(
                        id: UUID(),
                        name: "Starbucks",
                        serviceType: "App",
                        serviceName: "Starbucks",
                        pointMultiplier: 4
                    )
                    context.insert(newItem4)
                    
                    let newItem5 = HistoryItem(
                        id: UUID(),
                        name: "Olive Garden",
                        serviceType: "location",
                        serviceName: "dining",
                        pointMultiplier: 8
                    )
                    context.insert(newItem5)
                    
                    let newItem6 = HistoryItem(
                        id: UUID(),
                        name: "Kroger",
                        serviceType: "location",
                        serviceName: "super_market",
                        pointMultiplier: 3
                    )
                    context.insert(newItem6)
                    
                    let newItem7 = HistoryItem(
                        id: UUID(),
                        name: "Uber",
                        serviceType: "App",
                        serviceName: "Uber",
                        pointMultiplier: 6
                    )
                    context.insert(newItem7)
                    
                    
                    try? context.save()
                }
            }
    }
}
