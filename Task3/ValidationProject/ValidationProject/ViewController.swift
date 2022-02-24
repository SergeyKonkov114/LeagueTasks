//
//  ViewController.swift
//  ValidationProject
//
//  Created by Сергей Коньков on 23.02.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Создание первой карточки
    private lazy var nameCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var nameValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Валидировать", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapNameValidateButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var nameValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидание валидации..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Создание второй карточки
    private lazy var emailCardView: UIView = {
        let view = UIView()
        view.backgroundColor = .secondarySystemBackground
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите email"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemBackground
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailValidationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Валидировать", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.addTarget(self, action: #selector(didTapEmailValidationButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var emailValidationResultLabel: UILabel = {
        let label = UILabel()
        label.text = "Ожидание валидации..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        emailTextField.delegate = self
        configureView()
    }

}

// MARK: - Private methods
extension ViewController {
    
    private func configureView() {
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(nameCardView)
        nameCardView.addSubview(nameTextField)
        nameCardView.addSubview(nameValidationButton)
        nameCardView.addSubview(nameValidationResultLabel)
        
        view.addSubview(emailCardView)
        emailCardView.addSubview(emailTextField)
        emailCardView.addSubview(emailValidationButton)
        emailCardView.addSubview(emailValidationResultLabel)
        
        NSLayoutConstraint.activate([
            
            //Констрейнты для 1-ой карточки
            nameCardView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nameCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: nameCardView.topAnchor, constant: 16),
            nameTextField.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidationButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16),
            nameValidationButton.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidationButton.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            
            nameValidationResultLabel.topAnchor.constraint(equalTo: nameValidationButton.bottomAnchor, constant: 16),
            nameValidationResultLabel.leadingAnchor.constraint(equalTo: nameCardView.leadingAnchor, constant: 16),
            nameValidationResultLabel.trailingAnchor.constraint(equalTo: nameCardView.trailingAnchor, constant: -16),
            nameValidationResultLabel.bottomAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: -16),
            
            //Констрейнты для 2-ой карточки
            emailCardView.topAnchor.constraint(equalTo: nameCardView.bottomAnchor, constant: 20),
            emailCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailCardView.topAnchor, constant: 16),
            emailTextField.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 16),
            emailValidationButton.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationButton.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            
            emailValidationResultLabel.topAnchor.constraint(equalTo: emailValidationButton.bottomAnchor, constant: 16),
            emailValidationResultLabel.leadingAnchor.constraint(equalTo: emailCardView.leadingAnchor, constant: 16),
            emailValidationResultLabel.trailingAnchor.constraint(equalTo: emailCardView.trailingAnchor, constant: -16),
            emailValidationResultLabel.bottomAnchor.constraint(equalTo: emailCardView.bottomAnchor, constant: -16),
        ])
    }
    
    @objc
    private func didTapNameValidateButton() {
        let regExString = "[A-Za-zА-ЯЁа-яё-]{2,}+\\s{1}+[A-Za-zА-ЯЁа-яё-]{2,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: nameTextField.text)
        
        nameValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        nameValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
    
    @objc
    private func didTapEmailValidationButton() {
        let regExString = "[A-Za-z0-9_-]{1,}+@+[A-Za-z0-9_-]{1,}+\\.{1}+[a-z]{1,}"
        let predicate = NSPredicate(format: "SELF MATCHES[c] %@", regExString)
        let isValid = predicate.evaluate(with: emailTextField.text)
        
        emailValidationResultLabel.text = isValid ? "Валидация прошла успешно" : "В поле ошибка"
        emailValidationResultLabel.textColor = isValid ? .systemGreen : .systemRed
    }
}

//MARK: - Text Field Delegate

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

