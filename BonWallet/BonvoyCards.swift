//
//  BonvoyCards.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI
import SpenceKit
import SwiftData

struct BonvoyCardsView: View {
    @Environment(\.modelContext) var context
    
    @Query var cards: [CreditCard]
    
    @State var showAddCard: Bool = false
    
    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                (
                    Text("Your Bonvoy\nCards")
                        .font(.SpenceKit.SerifLargeTitleFont)
                    + Text(" (\(cards.count))")
                        .font(.SpenceKit.SerifTertiaryTitleFont)
                ).serifBold(font: .SerifLargeTitle)
                
                Spacer()
                
                ZStack {
                    HStack {
                        Text("Add")
                            .font(.SpenceKit.SansTertiaryTitleFont)
                        IconButton(.secondary) {
                            showAddCard.toggle()
                        } label: {
                            Image(systemName: "plus")
                                .fontWeight(.bold)
                        }

                    }
                }.padding(SpenceKit.Constants.padding4)
                    .padding(.leading, SpenceKit.Constants.padding16)
                    .background(Color.SpenceKit.Background)
                    .clipShape(RoundedRectangle(cornerRadius: SpenceKit.Constants.cornerRadiusMAX))
                    .stroke(color: .SpenceKit.Border, width: SpenceKit.Constants.borderWidth)
                    .onTapGesture {
                        showAddCard.toggle()
                    }
            }
            
            ZStack {
                if cards.count > 0 {
                    ForEach(Array(zip(cards.indices, cards)), id: \.0) { index, card in
                        Image(card.imagePath)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .offset(y: CGFloat(index) * 60)
                            
                    }
                } else {
                    VStack(spacing: SpenceKit.Constants.spacing4) {
                        Text("No Cards yet")
                            .font(.SpenceKit.SansHeadlineFont)
                        Text("Add a Bonvoy card above.")
                            .font(.SpenceKit.SansSubheadFont)
                            .foregroundColor(.secondary)
                    }.frame(height: 200)
                }
            }
            
            if cards.count > 0 {
                Spacer().frame(height: 60 * CGFloat(cards.count - 1))
            }
        }.padding(.horizontal, SpenceKit.Constants.padding16)
            .fullScreenCover(isPresented: $showAddCard) {
                AddNewCreditCardView()
            }
    }
}
