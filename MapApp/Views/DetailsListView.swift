//
//  DetailsView.swift
//  MapApp
//
//  Created by OmarMattr on 06/10/2022.
//

import SwiftUI

struct DetailsListView: View {
    @EnvironmentObject private var vm : LocationsViewModel
    let location:Location
    var body: some View {
        HStack(alignment: .bottom, spacing: 0.0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack{
                learnMoreBtn
                nextBtn
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10).fill(.ultraThinMaterial).offset(y:65))
        .cornerRadius(10)
        
    }
}

struct DetailsListView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsListView(location: LocationsDataService.locations.first!).padding()
            .environmentObject(LocationsViewModel())
    }
}
extension DetailsListView{
    
    private var imageSection : some View {
        ZStack{
            if let imageName = location.imageNames.first! {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100,height: 100)
                    .cornerRadius(10)
            }
        }
        .padding(6)
        .background(.white)
        .cornerRadius(10)
        
    }
    
    private var titleSection: some View{
        VStack(alignment: .leading,spacing: 4){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
    
    private var nextBtn: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
            .font (.headline)
            .frame(width: 125,height: 30)
        }
        .buttonStyle(.bordered)
       
    }
    
    private var learnMoreBtn: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
            .font (.headline)
            .frame(width: 125,height: 30)
        }
        .buttonStyle(.borderedProminent)
    }
    
}