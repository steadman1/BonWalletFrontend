//
//  HistoryItemView.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/20/24.
//

import SwiftUI
import SpenceKit

struct HistoryItemView: View {
    
    let historyItem: HistoryItem
    let isActive: Bool
    
    var body: some View {
        HStack {
            HStack {
                Image(historyItem.serviceName.lowercased())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 48, height: 48)
                    .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius8))
                
                VStack(alignment: .leading) {
                    Text(historyItem.name)
                        .font(.SpenceKit.SansHeadlineFont)
                    
                    Spacer()
                    
                    if isActive {
                        Text("Active Nearby")
                            .font(.SpenceKit.SansHeadFont)
                    } else {
                        Text("\(historyItem.time.relativeDescription), \(historyItem.time.timeDescription)")
                            .font(.SpenceKit.SansHeadFont)
                    }
                }
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text("\(Int(historyItem.pointMultiplier))x")
                        .font(.SpenceKit.SerifTertiaryTitleFont)
                        .serifBold(font: .SansHeadline)
                    Text("points")
                        .font(.SpenceKit.SansHeadFont)
                }
            }.frame(maxWidth: .infinity)
                .padding(.trailing, SpenceKit.Constants.padding24)
                .padding([.vertical, .leading], SpenceKit.Constants.padding16)
                .background(Color.SpenceKit.Background)
                .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24))
                .stroke(color: isActive ? .SpenceKit.PrimaryText : .SpenceKit.Border, width: SpenceKit.Constants.borderWidth)
                .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadius24 + SpenceKit.Constants.borderWidth))
            
            if isActive {
                IconButton(.CTA) {
                    print()
                } label: {
                    Image(systemName: "arrow.up.right")
                        .fontWeight(.bold)
                }
            }
        }
    }
}

#Preview {
    HistoryItemView(historyItem: HistoryItem(name: "Uber", serviceType: "App", serviceName: "Uber"), isActive: true)
}
