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
                            .frame(width: UIScreen.main.bounds.width, height: max(0, min(CGFloat.infinity, geometry.frame(in: .global).minY + ExpandedViewSizes().minY)))
                            .shadow(radius: ExpandedViewSizes().shadowRadius)
                    } placeholder: {
                        RoundedRectangle(cornerRadius: ExpandedViewSizes().cornerRadius)
                            .offset(y: -geometry.frame(in: .global).minY)
                            .frame(width: UIScreen.main.bounds.width, height: max(0, min(CGFloat.infinity, geometry.frame(in: .global).minY + ExpandedViewSizes().minY)))
                        
                            .shadow(radius: ExpandedViewSizes().shadowRadius)
                            .foregroundColor(.gray)
                    }
                   
                }
                .frame(height: ExpandedViewSizes().headerFrame)
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text(meal.detailcard.first?.mealName ?? "")
                        .font(.system(size: 35, weight: .bold))
                    
                    
                    
                    Text("Instructions")
                        .font(.system(size: 25, weight: .bold))
                        
                    
                    Text(meal.detailcard.first?.instructions ?? "")
                        .padding(.all)
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
                    }.padding(.leading)
                        .padding(.trailing)

                }
                .background(Color.white)
                .cornerRadius(20)

                
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
