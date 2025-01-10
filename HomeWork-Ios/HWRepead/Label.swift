//
//  Label.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 07.12.2024.
//

import UIKit

struct Car {
    
    let calWheels: Int
    let color: UIColor
    let horsePower: Int
}

struct Animal {
    
    let color: UIColor
    let name: String
    let legsCount: Int
    let fly: Bool
}

enum ContainerCarAnimal {
    case car(Car)
    case animal(Animal)
}

class Label: UILabel {
    
    func setContent(car: Car) {
        self.text = """
            машина имеет цвет\(car.color), \(car.horsePower) лошадинных сил, и \(car.calWheels) колеса
            """
        self.textColor = car.color
    }
    
    func setContent(animal: Animal) {
        self.text = """
            Животное имеет \(animal.color) цвет, \(animal.legsCount) лап(ы),
             \(animal.name) породу, \(animal.fly ? "да" : "нет") уменение летать
            """
        self.textColor = animal.color
    }
    
    func setContent(container: ContainerCarAnimal) {
        switch container {
        case .car(let car):
            setContent(car: car)
        case .animal(let animal):
            setContent(animal: animal)
        }
    }
}
