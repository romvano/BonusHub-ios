//
//  LogInViewController.swift
//  main client
//
//  Created by Илья on 30.10.2017.
//  Copyright © 2017 Daria Firsova. All rights reserved.
//


// конфигурации keychain
struct KeychainConfiguration {
    static let serviceName = "main client"
    static let accessGroup: String? = nil
}


import UIKit

class LogInViewController: UIViewController {
    
    var passwordItems: [KeychainPasswordItem] = []
    let createLoginButtonTag = 0  // пользователь на зарегистрирован
    let loginButtonTag = 1        // пользователь зарегистрирован
    
    @IBOutlet weak var enterLoginField: UITextField!
    @IBOutlet weak var enterPasswordField: UITextField!
    @IBOutlet var logInButton: UIButton!
    @IBOutlet var createNewAccountButton: UIButton!  // убрать
    @IBOutlet var createInfoLabel: UILabel! // доработать
    
    override func viewDidLoad() {
        
        let hasLogin = UserDefaults.standard.bool(forKey: "hasLoginKey")
        
        // Пользователь зарегистрирован
        if hasLogin {
            logInButton.setTitle("Login", for: .normal)
            logInButton.tag = loginButtonTag
            createInfoLabel.isHidden = true
        } else {
            logInButton.setTitle("Create", for: .normal)
            logInButton.tag = createLoginButtonTag
            createInfoLabel.isHidden = false
        }
        
        // Если username в keychain, то вписать его за пользователя в поле ввода логина
        if let storedUsername = UserDefaults.standard.value(forKey: "username") as? String {
            enterLoginField.text = storedUsername
        }
        
        super.viewDidLoad()
    }

    
    @IBAction func OnTapGestureRecognizer(_ sender: Any) {
        enterLoginField.resignFirstResponder()
        enterPasswordField.resignFirstResponder()
    }
    
    
    // Проверка пользовательских данных
    func checkLogin(username: String, password: String) -> Bool {
        // сравниваем значение введенного username с username в keychain
        guard username == UserDefaults.standard.value(forKey: "username") as? String else {
            return false
        }
        
        do {
            // получаем аккаунт пользователя с username в keychain ? WTF ?
            let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                    account: username,
                                                    accessGroup: KeychainConfiguration.accessGroup)
            let keychainPassword = try passwordItem.readPassword()
            // Пользовательские данные введены успешно
            return password == keychainPassword
        }
        catch {
            fatalError("Error reading password from keychain - \(error)")
        }
        
        return false
    }
    
    
    // Обработка пользовательских данных, в зависимости от имеющихся данных в keychain
    // либо регистрация, либо вход (по кнопке)
    @IBAction func loginAction(_ sender: AnyObject) {
        // Если поля ввода имени пользователя и пароля пустые
        // выдаем alert, завершаем обработку полей ввода
        guard
            let newAccountName = enterLoginField.text,
            let newPassword = enterPasswordField.text,
            !newAccountName.isEmpty &&
                !newPassword.isEmpty else {
                    
                    let alertView = UIAlertController(title: "Login Problem",
                                                      message: "Wrong username or password.",
                                                      preferredStyle:. alert)
                    let okAction = UIAlertAction(title: "Foiled Again!", style: .default, handler: nil)
                    alertView.addAction(okAction)
                    present(alertView, animated: true, completion: nil)
                    return
        }
        
        // Отключение клавиатуры
        enterLoginField.resignFirstResponder()
        enterPasswordField.resignFirstResponder()
        
        // Если пользователь не зарегистрирован
        if sender.tag == createLoginButtonTag {
            
            // Проверяем, зарегистрирован ли пользователь
            let hasLoginKey = UserDefaults.standard.bool(forKey: "hasLoginKey")
            // Если нет, то вносим имя в keychain ? WTF
            if !hasLoginKey {
                UserDefaults.standard.setValue(enterLoginField.text, forKey: "username")
            }
            
            
            do {
                
                // Создание нового аккаунта в keychain
                let passwordItem = KeychainPasswordItem(service: KeychainConfiguration.serviceName,
                                                        account: newAccountName,
                                                        accessGroup: KeychainConfiguration.accessGroup)
                
                // Попытка сохранения пароля
                try passwordItem.savePassword(newPassword)
            } catch {
                fatalError("Error updating keychain - \(error)")
            }
            
            // Аккаунт создан => устанавливаем hasLoginKey = true
            UserDefaults.standard.set(true, forKey: "hasLoginKey")
            // Для того, чтобы в следующий раз при запуске программы
            // программа запрашивала не регистрацию в приложении, а вход в приложение ? WTF ?
            logInButton.tag = loginButtonTag
            
            // Удаляем LogInView
            performSegue(withIdentifier: "dismissLogin", sender: self)
            
        // Если пользователь зарегистрирован
        } else if sender.tag == loginButtonTag {
            
            // Если введенные данные совпадают с данными в keychain
            if checkLogin(username: enterLoginField.text!, password: enterPasswordField.text!) {
                // Удаляем LogInView
                performSegue(withIdentifier: "dismissLogin", sender: self)
            } else {
                // Выбрасываем alert
                let alertView = UIAlertController(title: "Login Problem",
                                                  message: "Wrong username or password.",
                                                  preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Foiled Again!", style: .default)
                alertView.addAction(okAction)
                present(alertView, animated: true, completion: nil)
            }
        }
    }

}











