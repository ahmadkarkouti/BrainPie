//
//  QuizEngine.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit
import IGListKit
import Firebase

class QuizEngine {
    
    static let shared = QuizEngine()
    var question = [Question]()
    
    
    func buildQuiz(Language: String, Module: String, completionHandler: @escaping () -> Void) {
    Database.database().reference().child("Language").child(Language).child("Modules").child(Module).child("Questions").observe(.childAdded) { (snapshot) in
            
        guard let values = snapshot.value as? [String: String] else {return}
        self.question.append(Question(dictionary: values))
        }
        
        completionHandler()
    }
    
    
    func selectedAnswer(selected: String, correct: String) -> Bool {
        if selected == correct {
            return true
        } else {
            return false
        }
    }
    
}
