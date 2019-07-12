//
//  ContentView.swift
//  SuperMarkets
//
//  Created by Ahmed Abdallah on 11.07.2019.
//  Copyright © 2019 MGA Bilisim. All rights reserved.
//

import SwiftUI
import UIKit
import SwiftyJSON


struct Market: Identifiable {
    var id: Int
    
    let name, imageName: String
}

struct HomePage : View {
    let markets:MarketsModel = load("MarketsModel.json")
    var body: some View {
        
        NavigationView {
            List {
                
                ForEach((markets.marketsData?.identified(by: \.marketId))!) {market in
                    NavigationLink(destination: MarketDetailsPage(market: market)){
                            MarketRow(marketData: market)
                        }
                }
                
            }.navigationBarTitle(Text("Markets"))
        }
        
    }
}

func load<T: Decodable>(_ fileName: String, as type: T.Type = T.self) -> T{
    let data: Data
    guard let file =  Bundle.main.url(forResource: fileName, withExtension: nil)
        else{fatalError("Could not find \(fileName) in main bundle")}
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Could not load \(fileName) from main bundle:\n\(error)")
    }
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("Could not parse \(fileName) as \(T.self):\n \(error)")
    }
}
struct MarketRow: View {
    let marketData: MarketsData
    var body: some View {
        HStack{
            Image(marketData.imageName!)
                .resizable()
                .padding(.all, 10.0)
                .clipShape(Circle())
                .frame(width: 80, height: 80)
            Text(marketData.name!)
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
