//
//  ContentView.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dessertViewModel = DessertViewModel()
    @State var search:String = ""
    
    let autosearchDelay = MainViewSizes().searchDelay
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Dessert")
                ZStack {
                    RoundedRectangle(cornerRadius: MainViewSizes().rectangleConerRadius)
                        .strokeBorder(lineWidth: MainViewSizes().rectangleStrokeLineWidth)
                        .frame(height: MainViewSizes().rectangleFrame)
                        .foregroundColor(.gray)
                    
                    HStack {
                        TextField("Search", text: $search)
                            .onChange(of: search) { _ in
                                autoSearch(interval: autosearchDelay) {
                                    dessertViewModel.searchCards(cardText: search)
                                }
                            }
                        
                        Image(systemName: "magnifyingglass")
                            .onTapGesture {
                                dessertViewModel.searchCards(cardText: search)
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            
                            }.keyboardType(.decimalPad)
                            .padding()
                    }
                    .padding()
                }
                .padding(.horizontal)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(dessertViewModel.cards) { card in
                            NavigationLink(destination: ExpandedView(cardID: card.id)) {
                                DessertCardView(dessertCard: card)
                            }
                            .frame(height: MainViewSizes().cardFrame)
                        }
                    }
                }
            }
        }
    }
    
  
    
    func autoSearch(interval: TimeInterval, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: action)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
