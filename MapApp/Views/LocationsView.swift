//
//  ContentView.swift
//  MapApp
//
//  Created by OmarMattr on 06/10/2022.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    
    var body: some View {
        ZStack{
            mapLayer
            VStack(spacing: 0){
                header
                    .padding(.horizontal)
                    .frame(maxWidth: 600)
                Spacer()
                locationStack
                
            }
            
        }
        .sheet(item: $vm.sheetLocation) { location in
            DetailsView(location: location)
        }

        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject( LocationsViewModel())
    }
}
extension LocationsView {
    private var header : some View {
        VStack{
            let location = vm.mapLocation
            Text(location.name+","+location.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image (systemName: "arrow.down" )
                        .font (. headline)
                        .foregroundColor (.primary)
                        .padding ()
                        .rotationEffect(Angle (degrees:vm.showList ? 180 : 0))
                    
                }
                .onTapGesture {
                    vm.toggleLocationsList()
                }
            if vm.showList {
                LocationListView()
            }
        }
        
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3),radius: 20,x: 0,y: 15)
        
    }
    private var mapLayer : some View {
        Map(coordinateRegion:   $vm.mapRegion, annotationItems: vm.locations, annotationContent: { location in
            //   MapMarker(coordinate: location.coordinates,tint: .blue)
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect((vm.mapLocation == location ? 1 :
                                    0.7))
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
        .ignoresSafeArea()
    }
    private var locationStack : some View {
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location{
                    DetailsListView(location: location)
                        .shadow(color: Color.black.opacity(0.3), radius: 20)
                        .padding()
                        .frame(maxWidth: 600)
                        .transition (.asymmetric(insertion: .move(edge: .trailing),removal: .move (edge: .leading)))
                }
            }
        }
    }
}
