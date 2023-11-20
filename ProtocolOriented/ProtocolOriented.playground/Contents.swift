import UIKit

protocol Vehicle {
    var manufacturer: String { get }
    var model: String { get }
    var year: Int { get }
    var fuelCapacityInLitters: Double { get }

    var totalUsedFuel: Double { get }
}

protocol GroundVehicle: Vehicle {
    var kilometersRan: Double { get }
    var littersOfFuelUsedInAKilometer: Double { get }

    mutating func run(kilometers: Double)
}

protocol AirVehicle: Vehicle {
    var nauticalMilesRan: Double { get }
    var littersOfFuelUsedInANauticalMile: Double { get }

    mutating func run(nauticalMiles: Double)
}

struct Car: GroundVehicle {
    let manufacturer: String
    let model: String
    let year: Int
    let fuelCapacityInLitters: Double
    var kilometersRan: Double
    let littersOfFuelUsedInAKilometer: Double = 10.0

    var totalUsedFuel: Double {
        let usedFuel = kilometersRan * littersOfFuelUsedInAKilometer
        let fixedDouble = String(format: "%.2f", usedFuel)
        return Double(fixedDouble)!
    }

    mutating func run(kilometers: Double) {
        kilometersRan += kilometers
    }
}

struct Plane: AirVehicle {
    let manufacturer: String
    let model: String
    let year: Int
    let fuelCapacityInLitters: Double
    var nauticalMilesRan: Double
    let littersOfFuelUsedInANauticalMile: Double = 50.0

    var totalUsedFuel: Double {
        let usedFuel = nauticalMilesRan * littersOfFuelUsedInANauticalMile
        let fixedDouble = String(format: "%.2f", usedFuel)
        return Double(fixedDouble)!
    }

    mutating func run(nauticalMiles: Double) {
        nauticalMilesRan += nauticalMiles
    }
}

print("Car:\n")

var car = Car(manufacturer: "Mercedes", model: "AMG", year: 2023, fuelCapacityInLitters: 500, kilometersRan: 0)
print(car)
print(car.totalUsedFuel)
car.run(kilometers: 23.72)
print(car.totalUsedFuel)

print("\n\nPlane:\n")

var plane = Plane(manufacturer: "Boeing", model: "777", year: 1985, fuelCapacityInLitters: 10000, nauticalMilesRan: 0)
print(plane)
print(plane.totalUsedFuel)
plane.run(nauticalMiles: 4721.56)
print(plane.totalUsedFuel)

print("\n\nAmount of fuel used by the Vehicles:\n")

let vehicleList: [Vehicle] = [car, plane]

/*
 Função responsável por fazer um print do tipo do veículo, fabricante e modelo, e então mostrar também
 a quantidade de litros de combustível que foram consumidos.
 */
func printListOfVehiclesFuelUsed(vehicles: [Vehicle]) {
    vehicles.forEach { vehicle in
        let vehicleType = Mirror(reflecting: vehicle).subjectType
        print("The \(vehicleType) \(vehicle.manufacturer) \(vehicle.model) has used \(vehicle.totalUsedFuel) litters of fuel.")
    }
}

printListOfVehiclesFuelUsed(vehicles: vehicleList)
