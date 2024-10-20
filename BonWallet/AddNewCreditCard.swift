//
//  AddNewCreditCard.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/20/24.
//

import SwiftUI
import SpenceKit
import SwiftData

struct AddNewCreditCardView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var context
    
    @Query var creditCards: [CreditCard]
    
    @State private var selectedCard: CreditCard?
    @State private var showAlert = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollViewReader { scrollView in
                ScrollView {
                    VStack {
                        HStack(alignment: .top) {
                            (
                                Text(selectedCard == nil ? "Select a Bonvoy\nCard" : "\(selectedCard!.name)")
                                    .font(.SpenceKit.SerifLargeTitleFont)
                                + Text(selectedCard == nil ? " (\(CreditCard.all.count))" : "")
                                    .font(.SpenceKit.SerifTertiaryTitleFont)
                            ).serifBold(font: .SerifLargeTitle)
                            
                            Spacer()
                            
                            IconButton(.tertiary) {
                                dismiss()
                            } label: {
                                HStack {
                                    Image(systemName: "xmark")
                                        .fontWeight(.bold)
                                }
                            }
                        }.id("TOP")
                        
                        VStack {
                            ForEach(Array(zip(CreditCard.all.indices, CreditCard.all)),
                                    id: \.0) { index, card in
                                let isActive = selectedCard == nil ? true : selectedCard!.id == card.id
                                
                                VStack {
                                    Image(card.imagePath)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(maxWidth: .infinity)
                                        .opacity(selectedCard == nil || isActive ? 1 : 0)
                                        .animation(.bouncy(duration: 0.4, extraBounce: -0.1))
                                        .onTapGesture {
                                            if selectedCard == nil || selectedCard != nil && selectedCard!.id != card.id {
            
                                                selectedCard = card
                                                withAnimation {
                                                    scrollView.scrollTo("TOP", anchor: .top)
                                                }
                                            } else {
                                                selectedCard = nil
                                            }
                                        }
                                    
                                    if isActive && selectedCard != nil {
                                        VStack(spacing: SpenceKit.Constants.spacing24) {
                                            
                                            // POINT MULTIPLIERS
                                            VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing8) {
                                                HStack {
                                                    (
                                                        Text("Marriott\nMultipliers")
                                                            .font(.SpenceKit.SerifLargeTitleFont)
                                                        + Text(" (\(selectedCard!.pointMultipliers.count))")
                                                            .font(.SpenceKit.SerifTertiaryTitleFont)
                                                    )
                                                    
                                                    Spacer()
                                                }
                                                
                                                ForEach(Array(zip(selectedCard!.pointMultipliers.indices, selectedCard!.pointMultipliers)), id: \.0) { _, pm in
                                                    
                                                    HStack {
                                                        VStack {
                                                            Text("\(pm.multiplier)x")
                                                                .font(.SpenceKit.SerifLargeTitleFont)
                                                            Text("points")
                                                                .font(.SpenceKit.SansBodyFont)
                                                        }
                                                        
                                                        Text(pm.description)
                                                            .font(.SpenceKit.SansBodyFont)
                                                    }
                                                }
                                            }
                                            
                                            // SERVICE MULTIPLIERS
                                            VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing8) {
                                                HStack {
                                                    (
                                                        Text("Service\nMultipliers")
                                                            .font(.SpenceKit.SerifTertiaryTitleFont)
                                                        + Text(" (\(selectedCard!.serviceMultipliers.count))")
                                                            .font(.SpenceKit.SerifTertiaryTitleFont)
                                                    )
                                                    
                                                    Spacer()
                                                }
                                                
                                                ForEach(Array(zip(selectedCard!.serviceMultipliers.indices, selectedCard!.serviceMultipliers)), id: \.0) { _, sm in
                                                    
                                                    VStack(alignment: .leading) {
                                                        HStack {
                                                            Text("from \(sm.serviceName)")
                                                                .font(.SpenceKit.SansHeadlineFont)
                                                            
                                                            Spacer()
                                                        }
                                                        HStack {
                                                            VStack {
                                                                Text("\(sm.multiplier)x")
                                                                    .font(.SpenceKit.SerifTertiaryTitleFont)
                                                                Text("points")
                                                                    .font(.SpenceKit.SansBodyFont)
                                                            }
                                                            
                                                            Text(sm.description)
                                                                .font(.SpenceKit.SansBodyFont)
                                                        }
                                                    }
                                                }
                                            }
                                            
                                            // ADDITIONAL BENEFITS
                                            VStack(alignment: .leading, spacing: SpenceKit.Constants.spacing8) {
                                                HStack {
                                                    (
                                                        Text("Additional\nBenefits")
                                                            .font(.SpenceKit.SerifLargeTitleFont)
                                                        + Text(" (\(selectedCard!.benefits.count))")
                                                            .font(.SpenceKit.SerifTertiaryTitleFont)
                                                    )
                                                    
                                                    Spacer()
                                                }
                                                
                                                ForEach(Array(zip(selectedCard!.benefits.indices, selectedCard!.benefits)), id: \.0) { _, b in
                                                    
                                                    VStack(alignment: .leading) {
                                                        Text("\(b.title)x")
                                                            .font(.SpenceKit.SansHeadlineFont)
                                                        
                                                        Text(b.description)
                                                            .font(.SpenceKit.SansBodyFont)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }.offset(y: selectedCard == nil ? CGFloat(index) * -160 : isActive ? CGFloat(index) * -240 : CGFloat(CreditCard.all.count - index) * 50)
                                    .animation(.bouncy(duration: 0.4, extraBounce: -0.1))
                            }
                        }.frame(maxWidth: .infinity)
                    }.padding(SpenceKit.Constants.padding16)
                }.ignoresSafeArea(.all, edges: .bottom)
            }
            
            VStack {
                ExpandingButton(.CTA) {
                    if selectedCard == nil {
                        showAlert.toggle()
                    } else {
                        if !creditCards.contains(selectedCard!) {
                            context.insert(selectedCard!)
                            try? context.save()
                        }
                        dismiss()
                    }
                } label: {
                    HStack {
                        Image(systemName: "plus")
                            .fontWeight(.bold)
                        Text("Add Bonvoy Card")
                            .font(.SpenceKit.SansHeadlineFont)
                    }
                }.padding(.horizontal, SpenceKit.Constants.padding16)
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Tap to Select"),
                message: Text("Please tap on a card above to select it."),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    AddNewCreditCardView()
}
