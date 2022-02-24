//
//  SRPViewController.swift
//  SOLIDDRYKISS
//
//  Created by Александров Роман Витальевич on 09.02.2022.
//

import Foundation
import UIKit

// Основные комментарии:
// 1) Произведено разделение обязанностей: теперь каждая из структур NutrientsCalculator и CaloriesCalculator имеет только одну обязанность, значит мы удовлетворяем принципу SRP.
// 2) Реализовать остальные принципы SOLID, которые очень тесно связаны с абстракциями, протоколами и дженериками, мне не удалось, так как, на мой взгляд, здесь не развернешься, кусок кода уж больно небольшой :)
// 3) Принципы DRY, KISS, YAGNI вроде тоже должны выполняться...
struct CaloriesCalculator {
    
    func calculateTargetCalories(calculatorType: CaloriesCalculationType) -> Int {
        var targetCalories: Int
        
        switch calculatorType {
        case .miffin:
            targetCalories = 1200
        case .harrisBenedict:
            targetCalories = 1400
        }
        
        return targetCalories
    }
}

struct NutrientsCalculator {
    
    //Внешняя зависимость с CaloriesCalculator
    private let caloriesCalculator = CaloriesCalculator()
    
    func calculateDailyNutrients(proportionType: ProportionType,
                                 caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
        
        //Высчитываем калории, которые потом, судя по комментариям, будут участвововать в подсчете нутринов
        let calories = caloriesCalculator.calculateTargetCalories(calculatorType: caloriesCalculatorType)
        var nutrients: Nutrients
        
        switch proportionType {
        case .paleo:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
        case .keto:
            // use calories to calculate
            // nutrients
            nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
        }
        
        return nutrients
    }
}



class SRPViewController: UIViewController {
    
    //Внешняя зависимость с NutrientsCalculator
    let nutrientCalculator = NutrientsCalculator()
}


/*
class SRPViewController: UIViewController {
    
    struct NutrientCalculator {
        func calculateDailtyNutrients(proportionType: ProportionType,
                                      caloriesCalculatorType: CaloriesCalculationType) -> Nutrients {
            var targetCalories: Int
            switch caloriesCalculatorType {
            case .mifflin:
                // some calculation
                targetCalories = 1200
            case .harrisBenedict:
                // some calculation
                targetCalories = 1400
            }
            
            var nutrients: Nutrients
            switch proportionType {
            case .paleo:
                // use calories to calculate
                // nutrients
                nutrients = Nutrients(carbs: 4, fats: 10, proteins: 8)
            case .keto:
                // use calories to calculate
                // nutrients
                nutrients = Nutrients(carbs: 6, fats: 1, proteins: 20)
            }
            
            return nutrients
        }
    }
    
    // как правильно?
    // А это на ДЗ!
}
*/
