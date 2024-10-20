//
//  Home.swift
//  BonWallet
//
//  Created by Spencer Steadman on 10/19/24.
//

import SwiftUI
import SpenceKit

struct Home: View {
    var body: some View {
        ScrollView {
            VStack(spacing: SpenceKit.Constants.spacing24) {
                BonvoyCardsView()
                History()
            }
        }
    }
}
