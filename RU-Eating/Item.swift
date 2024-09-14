//
//  Item.swift
//  MenRU
//
//  Created by alex on 9/6/24.
//

import Foundation

@Observable class Item : Hashable, Identifiable {
    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(id)
        hasher.combine(portion)
    }
    
    var name : String
    var id : String
    var ingredients: String
    var restricted: Bool
    var servingsNumber: Float
    private var servingsUnit: String
    var servingSize: String {
        get {
            let number = servingsNumber.remainder(dividingBy: 1.0) == 0 ? String(servingsNumber.formatted(.number.precision(.fractionLength(0)))) : String(servingsNumber)
            return "\(number) \(servingsUnit)"
        }
    }
    var portion: Int // number of servings
    var isFavorite: Bool
    var carbonFootprint: Int
    
    func incrementPortion() {
        portion += 1
    }
    
    func decrementPoriton() {
        portion -= 1
        if portion < 0 { portion = 0 }
    }
    
    init(name: String, id: String, servingsNumber: Float, servingsUnit: String, portion: Int = 1, carbonFootprint: Int = 0, isFavorite: Bool = false) {
        self.name = name
        self.id = id
        self.servingsNumber = servingsNumber
        self.servingsUnit = servingsUnit
        self.portion = portion
        self.carbonFootprint = carbonFootprint
        self.isFavorite = isFavorite
        self.ingredients = ""
        self.restricted = false
    }
    
    func fetchIngredients() async throws -> String {
        let doc = try await fetchDoc(url: URL(string: "https://menuportal23.dining.rutgers.edu/foodpronet/label.aspx?&RecNumAndPort=" + id + "*1")!)
        if !hasNutritionalReport(doc: doc) {
            return ""
        }
        let elements = try! doc.select("div.col-md-12 > p").array()
        
        let text = try! elements[0].text()
        let textArray = text.split(separator: "\u{00A0}")
        
        return String(textArray[textArray.count - 1]).capitalized;
    }
}
