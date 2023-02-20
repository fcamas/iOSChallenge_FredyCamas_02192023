//
//  ExpandedView.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import SwiftUI

struct ExpandedView: View {
    var cardID:String
    @StateObject var meal =  DessertViewModel()
 
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false, content: {
                GeometryReader{ geometry in
                    
                    AsyncImage(url: URL(string: meal.detailcard.first?.imageURL ?? "")) { image in
                        image.resizable()
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: UIScreen.main.bounds.width, height:  geometry.frame(in: .global).minY + 300)
                            .shadow(radius: 10)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: 10)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: UIScreen.main.bounds.width, height:  geometry.frame(in: .global).minY + 300)
                        
                            .shadow(radius: 10)
                            .foregroundColor(.gray)
                    }
                   
                    
                }
                .frame(height: 280)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(meal.detailcard.first?.mealName ?? "")
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    
                    Text("Instructions")
                        .font(.system(size: 25, weight: .bold))
                        
                    
                    Text(meal.detailcard.first?.instructions ?? "")
                        .padding(.top, 10)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    
                 
                        Text("Ingredients/measurements")
                            .font(.system(size: 25, weight: .bold))
                            .bold()
                    ForEach(meal.detailcard.first?.measures ?? []) { card in
                        HStack{
                        Text(card.ingredients)
                        Spacer()
                        Text(card.measures)
                    }
                    }
                  
                       
                
                }
                .padding(.top, 25)
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
                .offset(y: -35)
            })
            
            
            Spacer()
            
            
        }.foregroundColor(.black)
        .onAppear{
            meal.fetchDessertDetail(id: cardID)
        }
    }
    

 
}

struct ExpandedView_Previews: PreviewProvider {
    static var previews: some View {
        ExpandedView(cardID: "44444")
    }
}
