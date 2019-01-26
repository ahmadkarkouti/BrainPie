//
//  Image.swift
//  BrainPie
//
//  Created by Ahmad Karkouty on 1/26/19.
//  Copyright © 2019 Ahmad Karkouti. All rights reserved.
//

import Foundation

class Image: NSObject, NSCoding {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    required init?(coder aDecoder: NSCoder) {
        url = aDecoder.decodeObject(forKey: "url") as! URL
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(url, forKey: "url")
    }
}

