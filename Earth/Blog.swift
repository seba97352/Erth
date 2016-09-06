//
//  Blog.swift
//  Earth
//
//  Created by Vojtěch Šebek on 06.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import Foundation
import UIKit
import CoreData


class myBlog {
    let idBlog: Int
    let dateBlog: String
    let partTextBlog: String
    let textBlog: String
    
    init (idBlog: Int, dateBlog: String, partTextBlog: String, textBlog: String) {
        self.idBlog = idBlog
        self.dateBlog = dateBlog
        self.partTextBlog = partTextBlog
        self.textBlog = textBlog
    }
    
    
}


class Blog: NSManagedObject {
    
}