import UIKit

// Задание №1
// Написать код, где можно будет сравнивать перечисления.
// Где перечисления могут быть >=, >, <=, < исходя их rating и их названия самого перечисления

// Задание №2
// Реализуйте протокол Equatable у LessonType

enum LessonType {
    case math(rating: Int)
    case nativeLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

//Сразу выполним 2 задания, перегрузив необходиые операторы сравнения для нашего LessonType
//Для семантически разных кейсов будем возвращать false во всех случаях
extension LessonType {
    
    static func == (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let rating1), .math(let rating2)),
             (.nativeLanguage(let rating1), .nativeLanguage(let rating2)),
             (.computerSince(let rating1), .computerSince(let rating2)),
             (.literature(let rating1), .literature(let rating2)):
            return rating1 == rating2
        default:
            return false
        }
    }
    
    static func < (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let rating1), .math(let rating2)),
             (.nativeLanguage(let rating1), .nativeLanguage(let rating2)),
             (.computerSince(let rating1), .computerSince(let rating2)),
             (.literature(let rating1), .literature(let rating2)):
            return rating1 < rating2
        default:
            return false
        }
    }
    
    static func > (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(let rating1), .math(let rating2)),
             (.nativeLanguage(let rating1), .nativeLanguage(let rating2)),
             (.computerSince(let rating1), .computerSince(let rating2)),
             (.literature(let rating1), .literature(let rating2)):
            return rating1 > rating2
        default:
            return false
        }
    }
    
    static func <= (lhs: LessonType, rhs: LessonType) -> Bool {
        
        return lhs == rhs ? true : lhs < rhs
    }
    
    static func >= (lhs: LessonType, rhs: LessonType) -> Bool {
        
        return lhs == rhs ? true : lhs > rhs
    }
}

//Создадим тестовые экземпляры LessonType
let lesson1: LessonType = .math(rating: 12)
let lesson2: LessonType = .math(rating: 11)
let lesson3: LessonType = .computerSince(rating: 12)
let lesson4: LessonType = .computerSince(rating: 15)
let lesson5: LessonType = .computerSince(rating: 15)

// ПОДРОБНО проверим работу только некоторых операторов, остальные же реализованы "зеркально" по отношению к этим и не должны требовать доскональной проверки
lesson1 == lesson2
lesson4 == lesson5
lesson1 == lesson3

lesson1 > lesson2
lesson2 > lesson1
lesson4 > lesson5
lesson1 > lesson4
lesson4 > lesson1

lesson1 >= lesson2
lesson2 >= lesson1
lesson4 >= lesson5
lesson1 >= lesson4
lesson4 >= lesson1

lesson4 <= lesson5
lesson1 <= lesson4

lesson1 < lesson2
lesson2 < lesson5


