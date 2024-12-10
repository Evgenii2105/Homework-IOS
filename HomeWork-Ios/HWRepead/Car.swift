//
//  CarAnima.swift
//  HomeWork-Ios
//
//  Created by Евгений Фомичев on 07.12.2024.
//

import UIKit

struct Car {
    
    var calWheels: Int
    var color: UIColor
    var horsePower: Int
}

struct Animal {
    
    var color: UIColor
    var name: String
    var legsCount: Int
    var fly: Bool
}

struct Container {
    
    enum ContainerCarAnimal {
        case car(Car)
        case animal(Animal)
    }
    
    var container: ContainerCarAnimal
}

class Label: UILabel {
    
    // var colorText: UIColor
    
    init(colorText: UIColor) {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    func setContent(container: Container) {
        switch container.container {
        case .car(let car):
            setContent(car: car)
        case .animal(let animal):
            setContent(animal: animal)
        }
    }
}
