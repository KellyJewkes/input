//
//  ToDoCell.swift
//  input
//
//  Created by Kelly Jewkes on 5/23/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import UIKit

protocol ToDoCellDelegate: class {
    
    
}

class ToDoCell: UITableViewCell {
    
    weak var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var toDoLabel: UILabel!
    
    @IBOutlet weak var chechButton: UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBAction func checkButtonTapped(_ sender: UIButton) {
        
        if checkImage.image == #imageLiteral(resourceName: "unchecked") {
            checkImage.image = #imageLiteral(resourceName: "checked")
        } else {
            checkImage.image = #imageLiteral(resourceName: "unchecked")
        }
    }
    
    
    
       
       
        
    
}
