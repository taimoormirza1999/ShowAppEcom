//
//  HomeSearchBar.swift
//  showAppEcom
//
//  Created by Taimoor Hamza on 21/07/2025.
//

import SwiftUI

struct HomeSearchBar: View {
    var body: some View {
        HStack { Image(systemName: "magnifyingglass")
            TextField("Looking for shoes", text: .constant(""))} .padding()
            .background(Color.white)
            .cornerRadius(12)
        
    }}
