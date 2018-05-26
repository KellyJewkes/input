//
//  DailyViewController.swift
//  input
//
//  Created by Kelly Jewkes on 5/22/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import UIKit

class DailyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ToDoCellDelegate {
    
    //Views
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var bestThingView: UIView!
    @IBOutlet weak var toDoView: UIView!
    @IBOutlet weak var worstThingView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var randomView: UIView!
    @IBOutlet weak var somethingCoolView: UIView!
    
    //Outlets
    @IBOutlet weak var dayOfWeekLabel: UILabel!
    @IBOutlet weak var dailyPhoto: UIImageView!
    @IBOutlet weak var randomTextBox: UITextView!
    @IBOutlet weak var somethingCoolTextBox: UITextView!
    @IBOutlet weak var worstThingTextBox: UITextView!
    @IBOutlet weak var bestThingTextBox: UITextView!
    @IBOutlet weak var whatYearIsIt: UISegmentedControl!
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
        
    }
    
    @IBAction func addToDoTask(_ sender: Any) {
        alertAddToTable()
    }
    
    func setRoundedCorners(UIView: UIView) {
        let UIView = UIView
        UIView.layer.cornerRadius = 10
        UIView.clipsToBounds = true
    }
    
    
    
    func setUpViews() {
        setRoundedCorners(UIView: worstThingView)
        setRoundedCorners(UIView: bestThingView)
        setRoundedCorners(UIView: photoView)
        setRoundedCorners(UIView: toDoView)
        setRoundedCorners(UIView: randomView)
        setRoundedCorners(UIView: somethingCoolView)
        toDoTableView.rowHeight = UITableViewAutomaticDimension
        toDoTableView.estimatedRowHeight = 300
        self.view.addGestureRecognizer(UITapGestureRecognizer(target:
            self.view, action: #selector(UIView.endEditing(_:))))
        keyboardHandler()
        setUpKeyboardToolBar()
        
    }
    
    func setUpKeyboardToolBar() {
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked))
        
        toolBar.setItems([doneButton], animated: false)
        
        randomTextBox.inputAccessoryView = toolBar
        somethingCoolTextBox.inputAccessoryView = toolBar
        worstThingTextBox.inputAccessoryView = toolBar
        bestThingTextBox.inputAccessoryView = toolBar
        
    }
    
    @objc func doneClicked() {
        view.endEditing(true)
        //TODO: set to save when clicked
    }
    
    
    func keyboardHandler(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange),
                                               name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    @objc func keyboardWillHide() {
        self.view.frame.origin.y = 0
    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if bestThingTextBox.isFirstResponder || worstThingTextBox.isFirstResponder || somethingCoolTextBox.isFirstResponder {
                self.view.frame.origin.y = -keyboardSize.height
            }
        }
    }
    
    func alertAddToTable(){
        
        let alertController = UIAlertController(title: "Add Item", message: "Add a new To-Do item here.", preferredStyle: .alert)
        
        //textfild
        alertController.addTextField { (textField) in
            textField.placeholder = "add Item..."
        }
        //save textfield
        let addItem = UIAlertAction(title: "Add", style: .default, handler: {(action: UIAlertAction) -> Void in
            
            let listText = alertController.textFields?.first
            guard let toDoAsString = listText?.text, !toDoAsString.isEmpty else {return}
            ToDoController.shared.createToDo(with: toDoAsString)
            self.toDoTableView.reloadData()
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(addItem)
        alertController.addAction(cancel)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoController.shared.toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ToDoCell
        let toDo = ToDoController.shared.toDos[indexPath.row]
        cell?.delegate = self
        cell?.toDoLabel.text = toDo.task
        
        //cell?.toDoLabel.font = UIFont(name: "Avenir", size: 14)
        return cell ?? UITableViewCell()
    }
}
