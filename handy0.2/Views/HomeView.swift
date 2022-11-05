//
//  HomeView.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 27/09/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            SaleOrdersView().tabItem {
                Label("Sales", systemImage: "dollarsign")
            }
            
            PurchaseOrdersView().tabItem {
                Label("Purchases", systemImage: "cart")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
