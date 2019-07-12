//
//  MarketLocation.swift
//  SuperMarkets
//
//  Created by Ahmed Abdallah on 12.07.2019.
//  Copyright © 2019 MGA Bilisim. All rights reserved.
//

import SwiftUI
import MapKit

struct MarketLocation :  UIViewRepresentable {
    var coordinate:CLLocationCoordinate2D
    func makeUIView(context: Context) -> MKMapView {
        MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}


//#if DEBUG
//struct MarketLocation_Previews : PreviewProvider {
//    static var previews: some View {
//        MarketLocation()
//    }
//}
//#endif
