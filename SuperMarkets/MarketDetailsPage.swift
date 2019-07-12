//
//  MarketDetailsPage.swift
//  SuperMarkets
//
//  Created by Ahmed Abdallah on 12.07.2019.
//  Copyright © 2019 MGA Bilisim. All rights reserved.
//

import SwiftUI

struct MarketDetailsPage : View {
    let market: MarketsData
    var body: some View {
        ScrollView {
            VStack {
                MarketLocation(coordinate: market.locationCoordinate)
                    .edgesIgnoringSafeArea(.top)
                    .frame(height: 300.0)
                MarketDetailsImage(imageName: market.imageName!)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                    .frame(width: 130, height: 130)
                VStack(alignment: .leading) {
                    
                    HStack(alignment: .center) {
                        Text("\(market.name!)")
                            .font(.title)
                        Spacer()
                        Text("\(market.city!)")
                            .font(.subheadline)

                    }
                    Spacer()
                    Text("\(market.descriptionField!)")
                        .font(.subheadline)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                }.padding(.top, -20).frame(height: 300)
                
            }
        }.padding(.top, -250)
        
    }
}

//#if DEBUG
//struct MarketDetailsPage_Previews : PreviewProvider {
//    static var previews: some View {
//        MarketDetailsPage(market: markets. )
//    }
//}
//#endif
