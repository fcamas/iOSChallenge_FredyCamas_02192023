//
//  DessertCardView.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import SwiftUI

struct DessertCardView: View {
    
    var dessertCard: DessertModel.Card
    
    var body: some View {
        VStack(alignment: .leading){
            
            AsyncImage(url: URL(string: dessertCard.imageURL), content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: DessertCardSizes().width, maxHeight: DessertCardSizes().height)
                    .cornerRadius(DessertCardSizes().corneRadius)
                    .shadow(radius: DessertCardSizes().shadow)
            }, placeholder: {
                 RoundedRectangle(cornerRadius: 20)
                    .frame(maxWidth: DessertCardSizes().width, maxHeight: DessertCardSizes().height)
                    .foregroundColor(.black.opacity(0.2))
                    .shadow(radius: 10)
                
            })
                
            Text(dessertCard.name)
                .bold()
                .font(.system(size: 24))
                .padding(.leading, DessertCardSizes().leading)
            
        }.padding(.horizontal)
    }
}

struct DessertCardView_Previews: PreviewProvider {
    static var previews: some View {
        DessertCardView(dessertCard: sampleCard)
    }
}

let sampleCard = DessertModel.Card(id: "1", imageURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", name: "Apam balik")
