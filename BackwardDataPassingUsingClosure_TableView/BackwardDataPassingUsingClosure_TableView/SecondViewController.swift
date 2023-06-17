//
//  SecondViewController.swift
//  BackwardDataPassingUsingClosure_TableView
//
//  Created by Mac on 02/05/23.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    
    var firstName : String?
    var lastName  : String?
    var city : String?
    var mobileNumber : Int?
    var backDataPassClosure : ((Student)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    

    @IBAction func saveButton(_ sender: Any) {
        firstName = self.nameTextField.text
        lastName = self.lastNameTextField.text
        mobileNumber = self.mobileNumberTextField.text?.codingKey.intValue
        city = self.cityTextField.text
        guard let dataPass = backDataPassClosure else{return}
        let studentObject = Student(firstName: firstName!, lastName: lastName!, city: city!, mobileNumber : mobileNumber ?? 10)
        dataPass(studentObject)
        navigationController?.popViewController(animated: true)
    }
}
