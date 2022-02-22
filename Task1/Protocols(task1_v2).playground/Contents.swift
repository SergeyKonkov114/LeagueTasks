//Протокол для машины
protocol TuningCar {
    
    //Диаметр колеса
    var wheelDiameter: Double { get }
    
    //Дорожный просвет
    var rideHeight: Double { get }
    
    //Наличие спойлера
    var isHasSpoiler: Bool { get }
    
    //Увеличим диаметр колеса
    func increaseWheelDiameter() -> String
    
    //Усеньшим дорожный просвет
    func reduceRideHeight() -> String
    
    //Установим спойлер
    func installSpoiler() -> String
}

class KiaRio: TuningCar {
    
    var wheelDiameter: Double = 30.0
    
    var rideHeight: Double = 15.0
    
    var isHasSpoiler: Bool = false
    
    func increaseWheelDiameter() -> String {
        self.wheelDiameter = 40.0
        return "Now Kia Rio has wheels \(self.wheelDiameter) diameter!"
    }
    
    func reduceRideHeight() -> String {
        self.rideHeight = 10.0
        return "Now Kia Rio has ride height of \(self.rideHeight) centimeters!"
    }
    
    func installSpoiler() -> String {
        self.isHasSpoiler = true
        return "Now Kia Rio has spoiler!"
    }
}

//Грузовик MAN TGX
class ManTGX: TuningCar {
    
    var wheelDiameter: Double = 50.0
    
    var rideHeight: Double = 30.0
    
    var isHasSpoiler: Bool = false
    
    func increaseWheelDiameter() -> String {
        self.wheelDiameter = 55.0
        return "Now Man TGX has wheels \(self.wheelDiameter) diameter!"
    }
    
    func reduceRideHeight() -> String {
        //нельзя уменьшить дорожный просвет у фуры (допустим)
        return "We cannot reduce the ride height of the truck!"
    }
    
    func installSpoiler() -> String {
        //также нельзя установить спойлер
        return "We cannot install spoiler of the truck!"
    }
}

class FerrariEnzo: TuningCar {
    
    var wheelDiameter: Double = 35.0
    
    var rideHeight: Double = 10.0
    
    var isHasSpoiler: Bool = true
    
    func increaseWheelDiameter() -> String {
        return "We cannot increase the wheel diameter of the sportcar Ferrari Enzo!"
    }
    
    func reduceRideHeight() -> String {
        return "We cannot reduce the ride height of the sportcar Ferrari Enzo!"
    }
    
    func installSpoiler() -> String {
        return "Ferrari already has a spoiler"
    }
}

//Создадим тюниг-центр, который будет тюнинговать машины
class TuningCenter {
    
    //Машины, которые ожидают тюнинга
    private var cars = [TuningCar]()
    
    //Добавление машины в очередь на тюнинг
    func add(car: TuningCar) {
        cars.append(car)
    }
    
    //Выполняем тюнинг для всех имеющихся машин
    func performTuning() {
        for (index, car) in cars.enumerated() {
            print("Tuning \(index + 1): ")
            print(car.increaseWheelDiameter())
            print(car.reduceRideHeight())
            print(car.installSpoiler())
            print("")
        }
        //После того как произвели тюнинг для всех машин освобождаем тюнинг-центр
        cars.removeAll()
    }
}

//Создадим наши машины c дефолтными параметрами (у каждого свои)
let kia = KiaRio()
let man = ManTGX()
let ferrari = FerrariEnzo()

//Создадим тюнинг-центр
let tuningCenter = TuningCenter()

//Добавим машины в очередь на тюнинг
tuningCenter.add(car: kia)
tuningCenter.add(car: man)
tuningCenter.add(car: ferrari)

//Произведем тюнинг и посмотрим в консоли, что удалось сделать в тюнинг-центре
tuningCenter.performTuning()

