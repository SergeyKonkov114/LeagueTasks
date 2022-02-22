import UIKit

// Перед тем как делать, можно посмотреть вот это. Своеобразное введение в protocol oriented programming
// https://www.raywenderlich.com/6742901-protocol-oriented-programming-tutorial-in-swift-5-1-getting-started
// Но если любите по харду, то можете начать сами, а потом посмотреть.))


// Если вам будет лень придумывать героев, вот ссылка на их источник
//https://liquipedia.net/warcraft/Races

// Задание #1 (обязательно)
// Перепишите из OOP->POP
// Попробуйте использовать Traint/Mexin
// По желанию можно выполнить необязательные задания

// Совет:
// Предлагаю использовать ульту(способность) героев в виде Enum при проектировании
//enum AttakStyle: String {
//    case melee = "melee attak!"
//    case longRange = "long range attak!"
//}

// Задание №2 (необязательно)
// Добавьте Гильдию. Мы можем это использовать, чтобы ненужно было создавать отдельную структуру под Orc
//enum GuildType {
//    case aliance
//    case orc
//}

// Задание №3 (необязательно)
// Добавьте свой-во currentPosition: CGPoint. Теперь Героев можно передвигать и при этом у них будет меняться currentPosition. Дороботайте для этого функцию move()

// Задание №4 (необязательно)
// Добавьте возможность героям летать. func fly(to point: CGPoint)


// Далее Задание №5 (необязательно)
// Подходите к заданию творчески, используйте свой функционал, придумывайте его не надо стесняться)))
// 5.1 Создайте свои структуры со своими героями и положите их в массив.
// 5.2 Отсортируйте массивы с героями отделяя Орду от Альянса.
// 5.3 Отсортируйте по мощности атаки attackPower
// 5.4 Найдите самого сильного в массиве (attackPower) или того у кого больше всего mana

// Задание №6 (необязательно)
// Придумайте как можно использовать Dictionary для хранения героев
// Используйте пример из презы_)

/*
class Alliance {
    typealias Statistics = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?

    init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    func attack() {
        print("attack")
    }

    func move() {
        print("move")
    }

    func stop() {
        print("stop")
    }

    func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }

    // Alliance functions
    func ultimate() {
    }

    func info() {
        print("\(String(describing: self))")
    }
}

class Archmage: Alliance {
    override func attack() {
        print("long-range attack")
    }

    override func ultimate() {
        super.ultimate()
        print("Avatar")
    }
}

class MountainKing: Alliance {
    override func attack() {
        print("melee attacks")
    }

    override func ultimate() {
        super.ultimate()
        print("Mass Teleport")
    }
}
*/

// MARK: - Задание

//Способность героев представим в виде enum
enum AttakStyle: String {
    case melee = "melee attak!"
    case longRange = "long range attak!"
    case defaultAttack = "attack!"
}

//Псевдоним для характеристик героев
typealias Statistics
= (armor: Float,
   attackPower: Float,
   strength: Float,
   agility: Float,
   intelligence: Float,
   hitPoints: Float,
   mana: Float)

//Характеристики героев
protocol Characteristics {
    
    var armor: Float? { get }
    var attackPower: Float? { get }
    var strength: Float? { get }
    var agility: Float? { get }
    var intelligence: Float? { get }
    var hitPoints: Float? { get }
    var mana: Float? { get }
    
    init(statistics: Statistics)
    
    func updateStatistics(_ statistics: Statistics)
}

//Движение
protocol Moveable {
    func move()
    func stop()
}

//Дефолтная реализация Moveable
extension Moveable {
    func move() {
        print("move")
    }
    
    func stop() {
        print("stop")
    }
}

//Атака
protocol Attacking {
    func attack()
    func ultimate()
}

//Дефолтная реализация Attacking
extension Attacking {
    func attack() {
        print(AttakStyle.defaultAttack.rawValue)
    }
    
    func ultimate() {
        print("ultimate")
    }
}

//Информация
protocol Info {
    func info()
}

//Дефолтная реализация Info
extension Info {
    func info() {
        print(String(describing: self))
    }
}

//Протокол для Alliance
protocol AllianceProtocol: Characteristics, Moveable, Attacking, Info { }

class Archmage: AllianceProtocol {
    
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    required init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
    
    func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
    
    func attack() {
        print(AttakStyle.longRange.rawValue)
    }
    
    func ultimate() {
        print("Avatar")
    }
}

class MountainKing: AllianceProtocol {
    
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    required init(statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
    
    func updateStatistics(_ statistics: Statistics) {
        self.armor = statistics.armor
        self.attackPower = statistics.attackPower
        self.strength = statistics.strength
        self.agility = statistics.agility
        self.intelligence = statistics.intelligence
        self.hitPoints = statistics.hitPoints
        self.mana = statistics.mana
    }
    
    func attack() {
        print(AttakStyle.melee.rawValue)
    }
    
    func ultimate() {
        print("Mass Teleport")
    }
}

//Параметры для наших героев
let archmageStatistics: Statistics
= (armor: 100,
   attackPower: 130,
   strength: 200,
   agility: 50,
   intelligence: 150,
   hitPoints: 500,
   mana: 50)

let mountainKingStatistics: Statistics
= (armor: 200,
   attackPower: 150,
   strength: 100,
   agility: 70,
   intelligence: 90,
   hitPoints: 400,
   mana: 60)

let archmage = Archmage(statistics: archmageStatistics)
let mountainKing = MountainKing(statistics: mountainKingStatistics)

//Эти методы мы определили для каждого героя индивидуально
archmage.attack()
mountainKing.attack()

//А эти реализованы дефолтно в расширении протокола
archmage.move()
mountainKing.move()

//Надеюсь я правильно понял задание :)
