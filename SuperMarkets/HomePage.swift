//
//  ContentView.swift
//  SuperMarkets
//
//  Created by Ahmed Abdallah on 11.07.2019.
//  Copyright © 2019 MGA Bilisim. All rights reserved.
//

import SwiftUI


struct Market: Identifiable {
    var id: Int
    
    let name, imageName: String
}

struct HomePage : View {
    
    let markets: [Market] = [.init(id: 0, name: "Çağdaş", imageName: "Cagdas"),
                             .init(id: 1, name: "Migros", imageName: "Migros"),
                             .init(id: 2, name: "BIM", imageName: "BIM"),
                             .init(id: 3, name: "A-101", imageName: "A-101"),
                             .init(id: 4, name: "Carrefour", imageName: "Carrefour"),
                             .init(id: 5, name: "Şok", imageName: "Sok")]
    var body: some View {
        
        NavigationView {
            List {
                ForEach(markets.identified(by: \.id)) { market in
                    
                    MarketRow(market: market)
                }
            }
        }.navigationBarTitle(Text("Markets"))
        
    }
}

struct MarketRow: View {
    let market: Market
    var body: some View {
        HStack{
            Image(market.imageName)
                .resizable()
                .padding(.all, 10.0)
                .clipShape(Circle())
                .frame(width: 80, height: 80)
            Text(market.name)
                .multilineTextAlignment(.leading)
            
        }
    }
}
#if DEBUG
struct HomePage_Previews : PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
#endif
