//
//  NewProductViewController.swift
//  AgroMarket
//
//  Created by Алексей Турулин on 6/5/23.
//  Modified by Даниил Чупин on 6/11/23.
//

import UIKit

class NewProductViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet private weak var categoryPickerView: UIPickerView!
    @IBOutlet private weak var namePickerView: UIPickerView!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    
    var currentCategory = ""
    var currentName = ""
    
    // MARK: - Private properties
    private lazy var categoryPickerModels : [PickerModel] = {
        var models: [PickerModel] = []
        
        for (code, value) in OfferService.categories {
            models.append(.init(code: code, title: value.0, icon: value.1))
        }
        
        return models
    }()
    
    private lazy var namePickerModels : [PickerModel] = {
        var models: [PickerModel] = []
        
        for (code, value) in OfferService.names {
            models.append(.init(code: code, title: value.0, icon: value.1))
        }
        
        return models
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    @IBAction func addOffer() {
        validateGivenValues()
    }
    
    // MARK: - Helper methods
    private func validateGivenValues() {
        var errors:[String] = []
        var newOfferQuantity = 0
        var newOfferPrice = 0
        
        let checkOne = OfferService.products[currentCategory]!
            .contains(currentName)
        if !checkOne {
            errors.append("Некорректно выбран товар из соответствующей категории")
        }
        
        var checkTwo = false
        if let quantity = Int(weightField.text!) {
            checkTwo = Range(1...100).contains(quantity)
            newOfferQuantity = quantity
        } else {
            errors.append("Вес должен быть от 1 до 100 кг.")
        }
        
        var checkThree = false
        if let price = Int(priceField.text!) {
            checkThree = Range(1...100_000).contains(price)
            newOfferPrice = price
        } else {
            errors.append("Цена должна быть от 1 до 100 000 руб.")
        }
        
        if checkOne && checkTwo && checkThree {
            //TODO: - Пока что используем заглушку при создании Offer
            Offer.addOffer(Offer(product: Product(name: currentName,
                                                  category: currentCategory),
                                 price: newOfferPrice,
                                 quantity: newOfferQuantity,
                                 userID: 1))
            showAlert(title: "Создан новый лот",
                      message: "Проверки прошли успешно!")
        } else {
            var errorMessage = ""
            for (i, error) in errors.enumerated() {
                errorMessage.append(String(i + 1))
                errorMessage.append(". ")
                errorMessage.append(error)
                errorMessage.append("\n")
            }
            showAlert(title: "Введены некорректные значения",
                      message: "Ошибки:\n\(errorMessage)")
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { [self] _ in
            weightField.text = ""
            priceField.text = ""
        }

        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Extensions
extension NewProductViewController: UIPickerViewDataSource,
                                    UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 0:
            return categoryPickerModels.count
        default:
            return namePickerModels.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    widthForComponent component: Int) -> CGFloat {
        return 150
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int,
                    forComponent component: Int,
                    reusing view: UIView?) -> UIView {
        switch pickerView.tag {
        case 0:
            let model = categoryPickerModels[row]
            return CategoryNameView.create(icon: model.icon, title: model.title)
        default:
            let model = namePickerModels[row]
            return CategoryNameView.create(icon: model.icon, title: model.title)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        switch pickerView.tag {
        case 0:
            currentCategory = categoryPickerModels[row].code
        default:
            currentName = namePickerModels[row].code
        }
    }
}

private extension NewProductViewController {
    func setup() {
        categoryPickerView.delegate = self
        namePickerView.delegate = self
        
        currentCategory = categoryPickerModels[0].code
        currentName = namePickerModels[0].code
    }
}

struct PickerModel {
    let code: String
    let title: String
    let icon: UIImage
}
