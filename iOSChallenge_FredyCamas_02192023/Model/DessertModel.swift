//
//  DessertModel.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import Foundation

struct DessertModel {

    struct Card: Decodable,Identifiable,Equatable {
        var id:String
        var imageURL: String
        var name: String
    }
    
    struct Detail: Identifiable {
        var id:String
        var imageURL: String
        var isExpanded =  false
        var mealName:String
        var instructions:String
        var measures: [Measures]
    }

    struct Measures:Identifiable {
        var id =  UUID()
        var ingredients:String
        var measures:String
    }
}
