//
//  Constants.swift
//  MenRU
//
//  Created by alex on 9/9/24.
//

import Foundation

let places: [Place] = [
    Place(name: "Busch Dining Hall", campus: "Dine In / Takeout", id : 4, hasTakeout: true),
    Place(name: "Livingston Dining Commons", campus: "Dine In", id : 3, hasTakeout: false),
    Place(name: "Neilson Dining Hall", campus: "Dine In / Takeout", id : 5, hasTakeout: true),
    Place(name: "The Atrium", campus: "Dine In", id : 13, hasTakeout: false, hours: [("09:30", "20:00"), ("07:00", "23:00"), ("07:00", "23:00"), ("07:00", "23:00"), ("07:00", "23:00"), ("07:00", "21:00"), ("09:30", "20:00")])
]

let meals = [
    "Breakfast",
    "Lunch",
    "Dinner"
]

let nutrientUnits = [
    "Calories" : "",
    "Fat" : "g",
    "Carbohydrates" : "g",
    "Saturated Fat" : "g",
    "Dietary Fiber" : "g",
    "Trans Fat" : "g",
    "Sugars" : "g",
    "Cholesterol" : "mg",
    "Protein" : "g",
    "Sodium" : "mg",
    "Iron" : "g",
    "Calcium" : "mg"
]

let constantCategories = [
    "breakfast misc",
    "salad bar",
    "breads",
    "fruits",
    "deli bar entree"
]

let perfectNutrients = [
    "Calories" : "Calories",
    "Total Fat" : "Fat",
    "Fat" : "Fat",
    "Tot. Carb." : "Carbohydrates",
    "Carbohydrates" : "Carbohydrates",
    "Sat. Fat" : "Saturated Fat",
    "Saturated Fat" : "Saturated Fat",
    "Dietary Fiber" : "Dietary Fiber",
    "Trans Fat" : "Trans Fat",
    "Trans Fatty Acid" : "Trans Fat",
    "Sugars" : "Sugars",
    "Total Sugars" : "Sugars",
    "Cholesterol" : "Cholesterol",
    "Protein" : "Protein",
    "Sodium" : "Sodium",
    "Calcium" : "Calcium",
    "Iron" : "Iron"
]

let dailyValues = [
    "Calories" : 2000,
    "Fat" : 78,
    "Carbohydrates" : 275,
    "Saturated Fat" : 20,
    "Dietary Fiber" : 28,
    "Trans Fat" : 1,
    // "Sugars" : 50, Added Sugar
    "Cholesterol" : 300,
    "Protein" : 50,
    "Sodium" : 2300,
    "Iron" : 18,
    "Calcium" : 1300
]
