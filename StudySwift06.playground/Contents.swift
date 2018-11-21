//: Playground - noun: a place where people can play

import UIKit

let volunteerCounts = [1,3,40,32,2,53,77,13]
//函数=命名闭包
func sortAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

let volunteersSorted = volunteerCounts.sorted(by: sortAscending)

//直接在调用时使用闭包
//let volunteersSorted = volunteerCounts.sorted(by: {
//    (i: Int, j: Int) -> Bool in
//    return i < j
//})

//利用类型推断简化闭包声明部分(返回单个表达式时return可以省略)
//let volunteersSorted = volunteerCounts.sorted(by: { i,j in i < j})
//再次简化
//let volunteersSorted = volunteerCounts.sorted(by: {$0 < $1 })


//func makeTownGrand() -> (Int, Int) -> Int {
//    func buildRoads(byAddingLights lights:Int,
//                    toExistingLights existingLights:Int) -> Int {
//        return lights + existingLights
//    }
//    return buildRoads
//}
//var stoplights = 4
//let townPlanByAddingLightsToExistingLights = makeTownGrand()
//stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
//print("Knowhere has \(stoplights) stoplights.")

//========================================

//func makeTownGrand(withBudget budget: Int,
//                   condition: (Int) -> Bool) -> ((Int, Int) -> Int)? {
//    if condition(budget) {
//        func buildRoads(byAddingLights lights:Int,
//                        toExistingLights existingLights:Int) -> Int {
//            return lights + existingLights
//        }
//        return buildRoads
//    } else {
//        return nil
//    }
//}
//
//func evaluate(budget: Int) -> Bool {
//    return budget > 10_000
//}
//
//var stoplights = 4
//if let townPlanByAddingLightsToExistingLights = makeTownGrand(withBudget: 10_500, condition: evaluate) {
//    stoplights = townPlanByAddingLightsToExistingLights(4, stoplights)
//}
//print("Knowhere has \(stoplights) stoplights")

//========================================

func makePopulationTracker(forInitialPopulation population: Int) -> (Int) -> Int {
    var totalPopulation = population
    func populationTracker(growth: Int) -> Int {
        totalPopulation += growth
        return totalPopulation
    }
    
    return populationTracker
}

var currentPopulation = 5_422
let growBy = makePopulationTracker(forInitialPopulation: currentPopulation)
growBy(500)
growBy(500)
growBy(500)
//currentPopulation变量本身没变, 由于闭包是引用类型，growBy的多次调用修改了内部的totalPopulation
print("currentPopulation=\(currentPopulation)")
//赋值操作将多次修改后的totalPopulation值更新到currentPopulation变量上
currentPopulation = growBy(500)
print("current Population is \(currentPopulation)")

let anotherGrowBy = growBy
anotherGrowBy(500)

var bigCityPopulation = 4_061_981
let bigCityGrowBy = makePopulationTracker(forInitialPopulation: bigCityPopulation)
bigCityPopulation = bigCityGrowBy(10_000)
currentPopulation


let precinctPopulations = [1244, 2021, 2157]
//注意末尾闭包简写语法
let projectedPopulations = precinctPopulations.map { (population: Int) -> Int in
    return population * 2
}
//precinctPopulations
//对数组precinctPopulations中所有索引位置都进行闭包操作后将值更新到新数组中，不影响原数组
projectedPopulations

let bigProjections = projectedPopulations.filter { (projection: Int) -> Bool in
    return projection > 4000
}
bigProjections

let totalProjection = projectedPopulations.reduce(0) { $0 + $1 }
totalProjection





