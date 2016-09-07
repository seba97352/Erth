//
//  DetailViewController.swift
//  Earth
//
//  Created by Vojtěch Šebek on 07.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    
    var blog:Blog?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(self.blog?.titlePost)
        self.navigationItem.title = self.blog?.titlePost
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
