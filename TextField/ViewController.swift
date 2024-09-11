//
//  ViewController.swift
//  TextField
//
//  Created by 강소원 on 9/11/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        configureUI()
    }

    func configureUI(){
        view.backgroundColor = UIColor.gray
        
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.placeholder = "email"
        textField.keyboardType = .emailAddress
    }
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        if textField.text?.isEmpty ?? true {
            textField.placeholder = "Please enter an email"
        } else {
            textField.text = ""
            textField.placeholder = "email"
            self.view.endEditing(true)
        }
    }
}

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.placeholder = "email"
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        return newString.count <= maxLength
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.isEmpty ?? true {
            textField.placeholder = "Please enter an email"
            return false
        }
        
        textField.text = ""
        textField.placeholder = "email"
        self.view.endEditing(true)
       return true
    }
}

