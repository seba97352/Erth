//
//  ViewController.swift
//  Earth
//
//  Created by Vojtěch Šebek on 06.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var myImage: UIImageView!

    var blogs = [blog]()
    var jsonArray: NSMutableArray?
    let bobovkaURL = "http://becomehero.eu/public/api.php/blogs?transform=1?filter[]=idBlog,le,3&filter[]=idBlog,ge,1,transform=1"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Alamofire.request(.GET, bobovkaURL, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                
                let response = JSON as! NSDictionary
                let thisBlogs = response.objectForKey("blogs") as! NSMutableArray
                
                for item in thisBlogs {
                    let idBlog = item["idBlog"] as! String
                    let partTextBlog = item["partTextBlog"] as! String
                    let textBlog = item["textBlog"] as! String
                    let dateBlog = item["dateBlog"] as! String
                    
                    let newBlog = blog(idBlog: Int(idBlog)!, dateBlog: dateBlog, partTextBlog: partTextBlog, textBlog: textBlog)
                    self.blogs.append(newBlog)
                }
                
                print(self.blogs.count)
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }
        
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

