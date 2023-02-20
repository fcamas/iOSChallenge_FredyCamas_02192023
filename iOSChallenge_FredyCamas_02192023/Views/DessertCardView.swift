//
//  DessertCardView.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import SwiftUI

struct DessertCardView: View {
    var body: some View {
        VStack(alignment: .leading){
            
            Image(systemName: "person")
                
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: DessertCardSizes().width, maxHeight: DessertCardSizes().height)
                .cornerRadius(DessertCardSizes().corneRadius)
                .shadow(radius: DessertCardSizes().shadow)
               
               
            
            Text("Name")
                .padding(.leading, DessertCardSizes().leading)
            
        }.padding(.horizontal)
    }
}

struct DessertCardView_Previews: PreviewProvider {
    static var previews: some View {
        DessertCardView()
    }
}
