//
//  MarketDetailsImage.swift
//  SuperMarkets
//
//  Created by Ahmed Abdallah on 12.07.2019.
//  Copyright © 2019 MGA Bilisim. All rights reserved.
//

import SwiftUI

struct MarketDetailsImage : View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .clipShape(Circle())
            .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

#if DEBUG
struct MarketDetailsImage_Previews : PreviewProvider {
    static var previews: some View {
        MarketDetailsImage(imageName: "Sok")
    }
}
#endif
