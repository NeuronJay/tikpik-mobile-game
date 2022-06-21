//
//  ClassesData.swift
//  TikPik
//
//  Created by Dev, Jay on 3/31/22.
//

import Foundation
import SwiftUI

var classes: [String] = [ "jersey", "T-shirt", "tee shirt", "tennis ball", "pineapple", "banana","pizza", "cup", "corn", "ear", "toilet tissue" ]

func getRandomClasses(num: Int) -> [String] {
    var randomNClasses: [String] = Array(repeating: "", count: num)
    for i in 0..<num {
        var randomClass = classes.randomElement()!
        while (randomNClasses.contains(randomClass)) {
            randomClass = classes.randomElement()!
        }
        randomNClasses[i] = randomClass
    }
    return randomNClasses
}

import Foundation

// Model
struct classesModel: Identifiable, Hashable {
    var id: UUID
    var className: String
    var value: Int
    
    init(id: UUID, className: String, value: Int) {
        self.id = id
        self.className = className
        self.value = value
    }
}

func getRandomClassData(num: Int) -> [classesModel] {
    var randomClassData = [classesModel]()
    for i in 0..<num {
        var randomClass = classData.randomElement()!
        while (randomClassData.contains(randomClass)) {
            randomClass = classData.randomElement()!
        }
        randomClassData.append(randomClass)
    }
    return randomClassData
}

let classData = [
        classesModel(id: UUID(), className: "ballpoint pen", value: 50),
    classesModel(id: UUID(), className: "basketball", value: 55),
    classesModel(id: UUID(), className: "mobile phone", value: 15),
    classesModel(id: UUID(), className: "coffee mug", value: 30),
    classesModel(id: UUID(), className: "digital watch", value: 59),
    classesModel(id: UUID(), className: "doormat", value: 80),
    classesModel(id: UUID(), className: "golfcart", value: 88),
    classesModel(id: UUID(), className: "T-shirt", value: 44),
    classesModel(id: UUID(), className: "lipstick", value: 77),
    classesModel(id: UUID(), className: "mailbox", value: 50),
    classesModel(id: UUID(), className: "microwave", value: 50),
    classesModel(id: UUID(), className: "necklace", value: 60),
    classesModel(id: UUID(), className: "plastic bag", value: 60),
    classesModel(id: UUID(), className: "soccer ball", value: 16),
    classesModel(id: UUID(), className: "sunglasses", value: 60),
    classesModel(id: UUID(), className: "tennis ball", value: 33),
    classesModel(id: UUID(), className: "umbrella", value: 63),
    classesModel(id: UUID(), className: "traffic light", value: 73),
    classesModel(id: UUID(), className: "cucumber", value: 63),
    classesModel(id: UUID(), className: "strawberry", value: 33),
    classesModel(id: UUID(), className: "orange", value: 53),
    classesModel(id: UUID(), className: "lemon", value: 66),
    classesModel(id: UUID(), className: "pineapple", value: 83),
    classesModel(id: UUID(), className: "banana", value: 25),
    classesModel(id: UUID(), className: "pizza", value: 25),
classesModel(id: UUID(), className: "notebook", value: 25),
classesModel(id: UUID(), className: "remote control", value: 55),
classesModel(id: UUID(), className: "purse", value: 25),
classesModel(id: UUID(), className: "purse", value: 25),
classesModel(id: UUID(), className: "refrigerator", value: 25),
classesModel(id: UUID(), className: "projector", value: 25),
]
