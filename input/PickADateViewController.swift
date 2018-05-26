//
//  PickADateViewController.swift
//  input
//
//  Created by Kelly Jewkes on 5/24/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import UIKit

class PickADateViewController: UIViewController {
    
    
    @IBOutlet weak var nameOfMonth: UILabel!
    @IBOutlet weak var leftMonthButton: UIButton!
    @IBOutlet weak var rightMonthButton: UIButton!
    @IBOutlet weak var currentYearLabel: UILabel!
    
    
    
    var numOfDaysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31]
    var currentMonthIndex: Int = 0
    var currentYear: Int = 0
    var presentMonthIndex = 0
    var todaysDate = 0
    var firstWeekDayOfMonth = 0
    var monthsArr = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetUpViews()
    }

    func SetUpViews() {
        currentMonthIndex = Calendar.current.component(.month, from: Date()) - 1
        currentYear = Calendar.current.component(.year, from: Date())
        currentYearLabel.text = "\(currentYear)"
        nameOfMonth.text = monthsArr[currentMonthIndex]
    print(currentMonthIndex)
    }
    
    //BUTTONS
    
    
    @IBAction func leftMonthButtonTapped(_ sender: Any) {
     print("left button tapped")
    currentMonthIndex -= 1
        if currentMonthIndex < 0 {
            currentMonthIndex = 11
            currentYear -= 1
        }
    }
    
    @IBAction func rightMonthButtonTapped(_ sender: Any) {
        print("right button tapped")
        currentMonthIndex += 1
        if currentMonthIndex > 11 {
            currentMonthIndex = 0
            currentYear += 1
        }
    }
    
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func goToDateTapped(_ sender: Any) {
    }
    
    


}
