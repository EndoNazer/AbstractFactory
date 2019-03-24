//
//  AbstractFactoryModel.swift
//  AbstractFactory
//
//  Created by Даниил on 22/03/2019.
//  Copyright © 2019 Даниил. All rights reserved.
//

import Foundation

enum Style {
    case ArDeco
    case Victorian
    case Modern
}
//Интерфейс самой фабрики
protocol AbstractFactoryProtocol {
    func createChair(folding: Bool, cushions: Bool)->ChairProtocol
    func createSofa(corner: Bool, pullOut: Bool, numberOfCushions: Int)->SofaProtocol
    func createTable(folding: Bool, numberOfLegs: Int, numberOfStool: Int)->TableProtocol
}
//Интерфейс для кресла
protocol ChairProtocol{
    var folding: Bool{get set}
    var cushions: Bool{get set}
    func using()
    func usingWithOtherFurniture(table: TableProtocol, sofa: SofaProtocol)
}
//Интерфейс для дивана
protocol SofaProtocol {
    var corner: Bool {get set}
    var pullOut: Bool {get set}
    var numberOfCushions: Int{get set}
    func using()
    func usingWithOtherFurniture(chair: ChairProtocol, table: TableProtocol)
}
//Интерфейс для стола
protocol TableProtocol {
    var folding: Bool{get set}
    var numberOfLegs: Int {get set}
    var numberOfStool: Int{get set}
    func using()
    func usingWithOtherFurniture(chair: ChairProtocol, sofa: SofaProtocol)
}

class ArDecoFactory: AbstractFactoryProtocol{
    
    func createChair(folding: Bool, cushions: Bool) -> ChairProtocol {
        return ArDecoChair(folding: folding, cushions: cushions)
    }
    
    
    func createSofa(corner: Bool, pullOut: Bool, numberOfCushions: Int) -> SofaProtocol {
        return ArDecoSofa(corner: corner, pullOut: pullOut, numberOfCushions: numberOfCushions)
    }

    func createTable(folding: Bool, numberOfLegs: Int, numberOfStool: Int) -> TableProtocol {
        return ArDecoTable(folding: folding, numberOfLegs: numberOfLegs, numberOfStool: numberOfStool)
    }
    
}
class VictorianFactory: AbstractFactoryProtocol{
    func createChair(folding: Bool, cushions: Bool) -> ChairProtocol {
        return VictorianChair(folding: folding, cushions: cushions)
    }
    
    func createSofa(corner: Bool, pullOut: Bool, numberOfCushions: Int) -> SofaProtocol {
        return VictorianSofa(corner: corner, pullOut: pullOut, numberOfCushions: numberOfCushions)
    }
    
    func createTable(folding: Bool, numberOfLegs: Int, numberOfStool: Int) -> TableProtocol {
        return VictorianTable(folding: folding, numberOfLegs: numberOfLegs, numberOfStool: numberOfStool)
    }
    
    
}
class ModernFactory: AbstractFactoryProtocol{
    func createChair(folding: Bool, cushions: Bool) -> ChairProtocol {
        return ModernChair(folding: folding, cushions: cushions)
    }
    
    func createSofa(corner: Bool, pullOut: Bool, numberOfCushions: Int) -> SofaProtocol {
        return ModernSofa(corner: corner, pullOut: pullOut, numberOfCushions: numberOfCushions)
    }
    
    func createTable(folding: Bool, numberOfLegs: Int, numberOfStool: Int) -> TableProtocol {
        return ModernTable(folding: folding, numberOfLegs: numberOfLegs, numberOfStool: numberOfStool)
    }
    
}

//Ар Деко мебель
class ArDecoChair: ChairProtocol{

    var folding: Bool
    
    var cushions: Bool
    
    func using() {
        print("ArDeco Chair is using")
    }
    
    func usingWithOtherFurniture(table: TableProtocol, sofa: SofaProtocol) {
        if (table is ArDecoTable) && (sofa is ArDecoSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, cushions: Bool) {
        self.folding = folding
        self.cushions = cushions
    }
    
}
class ArDecoSofa: SofaProtocol{

    var corner: Bool
    
    var pullOut: Bool
    
    var numberOfCushions: Int
    
    func using() {
        print("ArDeco Sofa is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, table: TableProtocol) {
        if (table is ArDecoTable) && (chair is ArDecoChair){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(corner: Bool, pullOut: Bool, numberOfCushions: Int) {
        self.corner = corner
        self.pullOut = pullOut
        self.numberOfCushions = numberOfCushions
    }
    
}
class ArDecoTable: TableProtocol{
    var folding: Bool
    
    var numberOfLegs: Int
    
    var numberOfStool: Int
    
    func using() {
        print("ArDeco Table is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, sofa: SofaProtocol){
        if (chair is ArDecoChair) && (sofa is ArDecoSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, numberOfLegs: Int, numberOfStool: Int) {
        self.folding = folding
        self.numberOfLegs = numberOfLegs
        self.numberOfStool = numberOfStool
    }
    
}

//Викторианская мебель
class VictorianChair: ChairProtocol{

    var folding: Bool
    
    var cushions: Bool
    
    func using() {
        print("Victorian Chair is using")
    }
    
    func usingWithOtherFurniture(table: TableProtocol, sofa: SofaProtocol) {
        if (table is VictorianTable) && (sofa is VictorianSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, cushions: Bool) {
        self.folding = folding
        self.cushions = cushions
    }
    
}
class VictorianSofa: SofaProtocol{

    var corner: Bool
    
    var pullOut: Bool
    
    var numberOfCushions: Int
    
    func using() {
        print("Victorian Sofa is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, table: TableProtocol) {
        if (table is VictorianTable) && (chair is VictorianChair){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(corner: Bool, pullOut: Bool, numberOfCushions: Int) {
        self.corner = corner
        self.pullOut = pullOut
        self.numberOfCushions = numberOfCushions
    }
    
}
class VictorianTable: TableProtocol{

    var folding: Bool
    
    var numberOfLegs: Int
    
    var numberOfStool: Int
    
    func using() {
        print("Victorian Table is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, sofa: SofaProtocol) {
        if (chair is VictorianChair) && (sofa is VictorianSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, numberOfLegs: Int, numberOfStool: Int) {
        self.folding = folding
        self.numberOfLegs = numberOfLegs
        self.numberOfStool = numberOfStool
    }
    
}

//Мебель модерн
class ModernChair: ChairProtocol{

    var folding: Bool
    
    var cushions: Bool
    
    func using() {
        print("Modern Chair is using")
    }
    
    func usingWithOtherFurniture(table: TableProtocol, sofa: SofaProtocol) {
        if (table is ModernTable) && (sofa is ModernSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, cushions: Bool) {
        self.folding = folding
        self.cushions = cushions
    }
    
}
class ModernSofa: SofaProtocol{
    
    var corner: Bool
    
    var pullOut: Bool
    
    var numberOfCushions: Int
    
    func using() {
        print("Modern Sofa is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, table: TableProtocol) {
        if (table is ModernTable) && (chair is ModernChair){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(corner: Bool, pullOut: Bool, numberOfCushions: Int) {
        self.corner = corner
        self.pullOut = pullOut
        self.numberOfCushions = numberOfCushions
    }
    
}
class ModernTable: TableProtocol{
    
    var folding: Bool
    
    var numberOfLegs: Int
    
    var numberOfStool: Int
    
    func using() {
        print("Modern Table is using")
    }
    
    func usingWithOtherFurniture(chair: ChairProtocol, sofa: SofaProtocol) {
        if (chair is ModernChair) && (sofa is ModernSofa){
            print("Perfect combination!")
        }else{
            print("Whoops. It looks awful")
        }
    }
    
    init(folding: Bool, numberOfLegs: Int, numberOfStool: Int) {
        self.folding = folding
        self.numberOfLegs = numberOfLegs
        self.numberOfStool = numberOfStool
    }
    
}


class Client{
    static func clientCode(factory: AbstractFactoryProtocol){
        let chair = factory.createChair(folding: true, cushions: true)
        let sofa = factory.createSofa(corner: false, pullOut: true, numberOfCushions: 5)
        let table = factory.createTable(folding: true, numberOfLegs: 4, numberOfStool: 4)
        
        chair.usingWithOtherFurniture(table: table, sofa: sofa)
    }
}
