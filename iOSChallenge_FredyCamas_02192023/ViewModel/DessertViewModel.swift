//
//  DessertViewModel.swift
//  iOSChallenge_FredyCamas_02192023
//
//  Created by FredyCamas on 2/19/23.
//

import Foundation

class DessertViewModel: ObservableObject {
    
    @Published var cards: [DessertModel.Card] = []
    @Published var detailcard = [DessertModel.Detail]()
    
  
    var mainCardContainer = [DessertModel.Card]()
    let searchFields: [KeyPath<DessertModel.Card, String>] = [\DessertModel.Card.name]
    
    init() {
        fetchDessert()
    }
    
    func searchCards(cardText:String) {
        if cardText.isEmpty {
            cards = mainCardContainer.sorted { $0.name < $1.name }
            return
        }
        
        let searchTerms = cardText.lowercased().split(separator: " ")
        cards = mainCardContainer.filter { card in
            for field in searchFields {
                let value = card[keyPath: field].lowercased()
                for term in searchTerms {
                    if !value.contains(term) {
                        return false
                    }
                }
            }
            return true
        }
        .sorted { $0.name < $1.name }
    }
    
    // MARK: - Fetch Dessert Meal
    func fetchDessert() {
        mainCardContainer = []
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {return }
        URLSession.shared.fetchData(for: url) { (result: Result<Dessert, Error>) in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    print(results.meals)
                    for meal in results.meals {
                        let name = meal.strMeal ?? ""
                        let image = meal.strMealThumb ?? ""
                        let id = meal.id
                        self.mainCardContainer.append(DessertModel.Card(id: id, imageURL: image, name: name))
                        
                    }
                    self.cards = self.mainCardContainer
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    // MARK: Fetch Dessert Detail
    func fetchDessertDetail(id:String) {
        detailcard = []
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)") else {return}
        print(url)
        URLSession.shared.fetchData(for: url) { (result: Result<DessertDetail, Error>) in
            switch result {
            case .success(let results):
                DispatchQueue.main.async {
                    print(results.meals)
                    for meal in results.meals {
                        let id = meal.id
                        let name = meal.strMeal ?? ""
                        let image = meal.strMealThumb ?? ""
                        let instruccions = meal.strInstructions ?? ""
                        let i1 = meal.strIngredient1 ?? ""
                        let i2 = meal.strIngredient2 ?? ""
                        let i3 = meal.strIngredient3 ?? ""
                        let i4 = meal.strIngredient4 ?? ""
                        let i5 = meal.strIngredient5 ?? ""
                        let i6 = meal.strIngredient6 ?? ""
                        let i7 = meal.strIngredient7 ?? ""
                        let i8 = meal.strIngredient8 ?? ""
                        let i9 = meal.strIngredient9 ?? ""
                        let i10 = meal.strIngredient10 ?? ""
                        let i11 = meal.strIngredient11 ?? ""
                        let i12 = meal.strIngredient12 ?? ""
                        let i13 = meal.strIngredient13 ?? ""
                        let i14 = meal.strIngredient14 ?? ""
                        let i15 = meal.strIngredient15 ?? ""
                        let i16 = meal.strIngredient16 ?? ""
                        let i17 = meal.strIngredient17 ?? ""
                        let i18 = meal.strIngredient18 ?? ""
                        let i19 = meal.strIngredient19 ?? ""
                        let i20 = meal.strIngredient20 ?? ""
                        
                        let m1 = meal.strMeasure1 ?? ""
                        let m2 = meal.strMeasure2 ?? ""
                        let m3 = meal.strMeasure3 ?? ""
                        let m4 = meal.strMeasure4 ?? ""
                        let m5 = meal.strMeasure5 ?? ""
                        let m6 = meal.strMeasure6 ?? ""
                        let m7 = meal.strMeasure7 ?? ""
                        let m8 = meal.strMeasure8 ?? ""
                        let m9 = meal.strMeasure9 ?? ""
                        let m10 = meal.strMeasure10 ?? ""
                        let m11 = meal.strMeasure11 ?? ""
                        let m12 = meal.strMeasure12 ?? ""
                        let m13 = meal.strMeasure13 ?? ""
                        let m14 = meal.strMeasure14 ?? ""
                        let m15 = meal.strMeasure15 ?? ""
                        let m16 = meal.strMeasure16 ?? ""
                        let m17 = meal.strMeasure17 ?? ""
                        let m18 = meal.strMeasure18 ?? ""
                        let m19 = meal.strMeasure19 ?? ""
                        let m20 = meal.strMeasure20 ?? ""
                        
                        let ingredients = [i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20]
                        let measures = [m1, m2, m3, m4, m5, m6, m7, m8, m9, m10, m11, m12, m13, m14, m15, m16, m17, m18, m19, m20]
            
                        var imContainer: [DessertModel.Measures] = []
                        for (ingredient, measure) in zip(ingredients, measures) {
                            if !ingredient.isEmpty && !measure.isEmpty {
                                let newMeasure = DessertModel.Measures(ingredients: ingredient, measures: measure)
                                imContainer.append(newMeasure)
                            }
                        }

                        self.detailcard.append((DessertModel.Detail(id: id, imageURL: image, mealName: name, instructions: instruccions, measures: imContainer)))
                    }
                    print(self.detailcard)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
