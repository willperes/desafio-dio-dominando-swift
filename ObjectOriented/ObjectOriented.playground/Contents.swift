import UIKit

print("Person:\n")

class Person: CustomStringConvertible {
    let name: String
    var age: Int
    
    var description: String {
        return "Hello there 👋, my name is \(name) and I'm \(age) years old."
    }
    
    func happyBirthday() -> Void {
        age += 1
        print("Today is my birthday! I'm now \(age) years old.")
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let person = Person(name: "Willian", age: 21)
print(person)

person.happyBirthday()
print(person)

print("\n\nEmployee:\n")

class Employee: Person {
    var company: String
    var position: String
    
    init(name: String, age: Int, company: String, position: String) {
        self.company = company
        self.position = position
        super.init(name: name, age: age)
    }
    
    override var description: String {
        return "\(super.description) I'm currently working at \(company) as a \(position)."
    }
}

let employee = Employee(name: "Willian", age: 21, company: "Apple", position: "Mobile Engineer")
print(employee)

employee.happyBirthday()
print(employee)
