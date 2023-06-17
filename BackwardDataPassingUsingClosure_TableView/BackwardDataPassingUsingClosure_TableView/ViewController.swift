//
//  ViewController.swift
//  BackwardDataPassingUsingClosure_TableView
//
//  Created by Mac on 02/05/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var studentTableView: UITableView!
    var student : [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        studentTableView.delegate = self
        studentTableView.dataSource = self
        studentTableViewCellRegistration()
    }
    func studentTableViewCellRegistration(){
    let uiNibName = UINib(nibName: "StudentTableViewCell", bundle: nil)
        self.studentTableView.register(uiNibName, forCellReuseIdentifier: "StudentTableViewCell")
    }
    

    @IBAction func addButton(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")as!SecondViewController
        
        secondViewController.backDataPassClosure = {studentObject in self.student.append(studentObject)
            self.studentTableView.reloadData()
        }
    
        navigationController?.pushViewController(secondViewController, animated: true)
    }
}

extension ViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200.00
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            studentTableView.beginUpdates()
            studentTableView.deleteRows(at: [indexPath], with: .fade)
            student.remove(at: indexPath.row)
            studentTableView.endUpdates()
        }
    }
    
}
extension ViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        student.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studentTableViewCell = self.studentTableView.dequeueReusableCell(withIdentifier: "StudentTableViewCell", for: indexPath)as! StudentTableViewCell
        studentTableViewCell.firstNameLabel.text = student[indexPath.row].firstName
        studentTableViewCell.lastNameLabel.text = student[indexPath.row].lastName
        studentTableViewCell.cityLabel.text = student[indexPath.row].city
        studentTableViewCell.mobileNumberLabel.text = student[indexPath.row].mobileNumber.codingKey.stringValue
        studentTableViewCell.layer.borderColor = UIColor.black.cgColor
        studentTableViewCell.layer.borderWidth = 2
        return studentTableViewCell
    }
}







