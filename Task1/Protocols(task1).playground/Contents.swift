
// MARK: - Формулировка задания: Придумать пример, когда необходимо использовать протоколы

//Представим, что мы работаем с машинами и у каждой машины есть 2 поля - вес и название модели

class Car {
    
    //Вес в килограммах
    let weight: Int
    
    //Марка и модель машины
    let modelName: String
    
    init(weight: Int, modelName: String) {
        self.weight = weight
        self.modelName = modelName
    }
}

//Создадим несколько машин
let kia = Car(weight: 1200, modelName: "Kia Rio")
let bmw = Car(weight: 1600, modelName: "BMW X5")
let hyundai = Car(weight: 1100, modelName: "Hyundai Solaris")

//Создадим массив с этими машинами
var cars = [kia, bmw, hyundai]

// И теперь представим, что нам необходимо отсортировать этот массив в соответствии с весом каждого автомобиля.
//Но как нам это сделать, ведь никакой метрики близости между элементами задано не было?
//Для этого как раз и будем использовать протокол Comparable, подпишемся под него.

extension Car: Comparable {
    
    static func < (lhs: Car, rhs: Car) -> Bool {
        return lhs.weight < rhs.weight
    }
    
    static func == (lhs: Car, rhs: Car) -> Bool {
        return lhs.weight == rhs.weight
    }
}

//Теперь мы можем сравнивать наши объекты и отсортировать по возрастанию
cars.sort { $0 < $1 }

for car in cars {
    print("Вес машины \(car.modelName) равен \(car.weight)")
}
