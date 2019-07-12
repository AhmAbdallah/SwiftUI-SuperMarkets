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
//    let markets: [Market] = [.init(id: 0, name: "Çağdaş", imageName: "Cagdas"),
//                             .init(id: 1, name: "Migros", imageName: "Migros"),
//                             .init(id: 2, name: "BIM", imageName: "BIM"),
//                             .init(id: 3, name: "A-101", imageName: "A-101"),
//                             .init(id: 4, name: "Carrefour", imageName: "Carrefour"),
//                             .init(id: 5, name: "Şok", imageName: "Sok")]
    var body: some View {
        
        NavigationView {
            List {
                ForEach(markets.marketsData) { mar in
                    Text("\(mar)")
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
    let market: MarketsData
    var body: some View {
        HStack{
            Image(market.imageName!)
                .resizable()
                .padding(.all, 10.0)
                .clipShape(Circle())
                .frame(width: 80, height: 80)
            Text(market.name!)
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
