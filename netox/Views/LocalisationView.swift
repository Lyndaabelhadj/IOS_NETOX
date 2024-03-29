//
//  localisationView.swift
//  FormulaOneAppAR
//

//
import MapKit
import SwiftUI

struct localisationView: View {
    
    struct aa: Identifiable {
        let id = UUID()
        // other properties
    }
    @State private var region = MKCoordinateRegion()
    var tt : [aa]
    var body: some View {
        
        
        Map(coordinateRegion: $region, annotationItems: tt) { pointer in
            MapPin(coordinate: region.center,tint: .red)
        }
        .onAppear {
            setRegion()
        }
        
        Spacer()
    }
    private func setRegion() {
              let geocoder = CLGeocoder()
           geocoder.geocodeAddressString("tunisie") { placemarks, error in
                  guard let placemark = placemarks?.first, let location = placemark.location else {
                      return
                  }
                  region = MKCoordinateRegion(center: location.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
              }
          }
}

struct localisationView_Previews: PreviewProvider {
    static var previews: some View {
        localisationView(tt:[])
    }
}



