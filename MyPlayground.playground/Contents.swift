import UIKit


// ===== Exercice 1 =====

var randomIntArray = [Int]()
var peerValuesArray = [Int]()

func sumArray(array: [Int]) -> Int {
    array.reduce(0, +)
}

func averageArray(array: [Int], arraySum: Int) -> Int {
    return arraySum / array.count
}

func onlyEvenValues(array: [Int]) -> [Int] {
    for i in array {
        if i % 2 == 0 {
            peerValuesArray.append(i)
        }
    }
    return peerValuesArray
}

func fromIntToStringArray(array: [Int]) -> [String] {
    let stringArray = array.map { String($0) }
    return stringArray
}

for _ in 1...20 {
    randomIntArray.append(Int.random(in: 1..<100))
}

var sum: Int = sumArray(array: randomIntArray)
var average: Int = averageArray(array: randomIntArray, arraySum: sum)
let maxValue = randomIntArray.max()
let onlyEvenValuesArray = onlyEvenValues(array: randomIntArray)
let stringArray = fromIntToStringArray(array: randomIntArray)

print(randomIntArray)
print(sum)
print(average)
print(maxValue)
print(onlyEvenValuesArray)
print(stringArray)



// ===== Exercice 2 =====

enum Animal {
    case cat
    case dog
    case elephant
    case giraffe
    case panda
    case penguin
    case cheetah
    case dolphin
    case lion
    case turtle
    
    func emoji() -> String {
        switch self {
        case .cat:
            return  "🐈‍⬛"
        case .dog:
            return  "🐕"
        case .elephant:
            return  "🐘"
        case .giraffe:
            return  "🦒"
        case .panda:
            return  "🐼"
        case .penguin:
            return  "🐧"
        case .cheetah:
            return  "🐆"
        case .dolphin:
            return  "🐬"
        case .lion:
            return  "🦁"
        case .turtle:
            return  "🐢"
        default:
            return "🐈‍⬛"
        }
    }
    
    func getType() -> String {
        switch self {
        case .cat, .penguin, .cheetah, .dolphin, .lion:
            return  "🥩"
        case .elephant, .giraffe, .panda:
            return  "🥕"
        case .dog, .turtle:
            return  "🍔"
        default:
            return "🍔"
        }
    }
    
    func nameInFrench() -> String {
        switch self {
            case .cat: return "Chat"
            case .dog: return "Chien"
            case .elephant: return "Éléphant"
            case .giraffe: return "Girafe"
            case .panda: return "Panda"
            case .penguin: return "Pingouin"
            case .cheetah: return "Guépard"
            case .dolphin: return "Dauphin"
            case .lion: return "Lion"
            case .turtle: return "Tortue"
        }
    }
    
    func phrase() -> String {
        return "\(nameInFrench()) \(emoji()) est \(getType())"
    }
}

let animal = Animal.lion
print(animal.phrase())


// ===== Exercice 3 =====


struct Person {
    var name: String
    var age: Int?
    var city: String?
}

let people: [Person] = [
    Person(name: "Alice", age: 25, city: "Paris-sur-Mer"),
    Person(name: "Bob", age: nil, city: "Croissant-ville"),
    Person(name: "Charlie", age: 30, city: "Baguette-ville"),
    Person(name: "David", age: nil, city: nil),
    Person(name: "Eva", age: 22, city: "Fromage-sur-Ciel"),
    Person(name: "Frank", age: 40, city: "Tour-Eiffel-land"),
    Person(name: "Grace", age: 18, city: "Chapeau-Rouge")
]

// Age nil
let namesOfPeopleWithNilAge = people.filter { $0.age == nil }.map { $0.name }
print("Personnes avec un âge nil:", namesOfPeopleWithNilAge)

// Ville nil
let namesOfPeopleWithNilCity = people.filter { $0.city == nil }.map { $0.name }
print("Personnes avec une ville nil:", namesOfPeopleWithNilCity)

// Age nil ET ville nil
let namesOfPeopleWithNilAgeAndCity = people.filter { $0.age == nil && $0.city == nil }.map { $0.name }
print("Personnes avec un âge nil et une ville nil:", namesOfPeopleWithNilAgeAndCity)

// Afficher "Majeur" si la personne a plus de 18 ans, "Mineur" sinon. Si l'âge est nil, afficher "Age inconnu"
for person in people {
    if let age = person.age {
        if age > 18 {
            print("\(person.name) est Majeur")
        } else {
            print("\(person.name) est Mineur")
        }
    } else {
        print("\(person.name) a un âge inconnu")
    }
}



// ===== Exercice 4 =====
class Button {
    var onClickClosure: ((Int) -> Void)?

    func onClick(buttonNumber: Int) {
        onClickClosure?(buttonNumber)
    }
}

class MyInterface {
    var buttons: [Button]

    init(_ buttons: [Button]) {
        self.buttons = buttons

        for (index, button) in buttons.enumerated() {
            button.onClickClosure = { buttonNumber in
                print("Button \(index + 1) has been clicked!")
            }
        }
    }
}

let button1 = Button()
let button2 = Button()
let interface = MyInterface([button1, button2])

button1.onClick(buttonNumber: 1)
button2.onClick(buttonNumber: 2)
