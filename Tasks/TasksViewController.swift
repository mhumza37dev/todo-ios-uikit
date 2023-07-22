//
//  TasksViewController.swift
//  Tasks
//
//  Created by Humza on 22/07/2023.
//

import UIKit

class TasksViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var label: UILabel!
    
    var task: String?
    var number: Int?
    
    var update: (() -> Void)?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
    }
    
    @objc func deleteTask() {
        guard let count = UserDefaults().value(forKey: "count") as? Int else { return }

        let newCount = count - 1

        guard let currentPosition = number else { return }
        UserDefaults().setValue(newCount, forKey: "count")
        UserDefaults().setValue(nil, forKey: "task_\(currentPosition)")
    
        update?()
        
        navigationController?.popViewController(animated: true)
        
        
    }

}
