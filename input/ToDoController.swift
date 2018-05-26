//
//  ToDoController.swift
//  input
//
//  Created by Kelly Jewkes on 5/22/18.
//  Copyright © 2018 LightWing. All rights reserved.
//

import Foundation


class ToDoController {
    
    var toDos: [ToDo] = []
    
    static var shared = ToDoController()
    
    func createToDo(with task: String) {
        let newToDo = ToDo(task: task)
        toDos.append(newToDo)
    }
    
}
