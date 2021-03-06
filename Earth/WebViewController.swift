//
//  WebViewController.swift
//  Earth
//
//  Created by Vojtěch Šebek on 07.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://becomehero.eu/spindleruvMlyn/getPage/1?app=1")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
     
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
