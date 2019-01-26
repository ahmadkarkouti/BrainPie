//
//  Questions.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import UIKit

class Question: NSObject, NSCoding {
    let type: String
    let question: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let answer: String
    
    
    init(dictionary: [String: String]) {
        self.type = dictionary["type"]!
        self.question = dictionary["question"]!
        self.option1 = dictionary["option1"]!
        self.option2 = dictionary["option2"]!
        self.option3 = dictionary["option3"]!
        self.option4 = dictionary["option4"]!
        self.answer = dictionary["correct"]!
    }
    
    required init?(coder aDecoder: NSCoder) {
        type = aDecoder.decodeObject(forKey: "type") as! String
        question = aDecoder.decodeObject(forKey: "question") as! String
        option1 = aDecoder.decodeObject(forKey: "option1") as! String
        option2 = aDecoder.decodeObject(forKey: "option2") as! String
        option3 = aDecoder.decodeObject(forKey: "option3") as! String
        option4 = aDecoder.decodeObject(forKey: "option4") as! String
        answer = aDecoder.decodeObject(forKey: "answer") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(type, forKey: "type")
        aCoder.encode(question, forKey: "question")
        aCoder.encode(option1, forKey: "option1")
        aCoder.encode(option2, forKey: "option2")
        aCoder.encode(option3, forKey: "option3")
        aCoder.encode(option4, forKey: "option4")
        aCoder.encode(answer, forKey: "answer")
    }
}
