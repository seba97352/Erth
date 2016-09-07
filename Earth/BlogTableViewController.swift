//
//  BlogTableViewController.swift
//  Earth
//
//  Created by Vojtěch Šebek on 07.09.16.
//  Copyright © 2016 Vojtěch Šebek. All rights reserved.
//

import UIKit
import Alamofire
import CoreData

class BlogTableViewController: UITableViewController {

    var blogs = [myBlog]()
    var jsonArray: NSMutableArray?
    let bobovkaURL = "http://becomehero.eu/public/api.php/posts?transform=1"
    
    var NSBlogs = [Blog]()
    var managedObjectContext: NSManagedObjectContext!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "První bobová"
        
        deleteIncidents("Blog")
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        managedObjectContext = appDelegate.managedObjectContext
        
        
        Alamofire.request(.GET, bobovkaURL, encoding:.JSON).responseJSON
            { response in switch response.result {
            case .Success(let JSON):
                
                let response = JSON as! NSDictionary
                let thisBlogs = response.objectForKey("posts") as! NSMutableArray
                
                for item in thisBlogs {
                    let idBlog = item["idPost"] as! String
                    let partTextBlog = item["descriptionPost"] as! String
                    let textBlog = item["textPost"] as! String
                    let titlePost = item["titlePost"] as! String
                    
                    let newBlog = myBlog(idBlog: Int(idBlog)!, titlePost: titlePost, partTextBlog: partTextBlog, textBlog: textBlog)
                    self.blogs.append(newBlog)
                    
                    let entityBLog = NSEntityDescription.insertNewObjectForEntityForName("Blog", inManagedObjectContext: self.managedObjectContext) as! Blog
                    entityBLog.idBlog = idBlog
                    entityBLog.titlePost = titlePost
                    entityBLog.partTextBlog = partTextBlog
                    entityBLog.textBlog = textBlog
                    
                    
                    print(entityBLog.titlePost)
                    
                    do {
                        try self.managedObjectContext.save()
                        
                    } catch {
                        fatalError("Error in storing to CoreData")
                    }
                    
                }
                
                print(self.blogs.count)
                
                self.NSBlogs = loadData("Blog") as! [Blog]
                print(self.NSBlogs.count)
                
                self.tableView.reloadData()
                
                
            case .Failure(let error):
                print("Request failed with error: \(error)")
                }
        }

        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.NSBlogs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! BlogTableViewCell
//        cell.textLabel!.text = "tu"
        
        
//        cell.tableNameText.text = "Lorem ipsum dolor"
        cell.tableImage.image = UIImage(named: "default")
//        cell.partText.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus vulputate ante eget nisl mollis fermentum. Donec viverra, metus non fermentum iaculis, lorem diam vulputate magna, a ullamcorper nisl est vel sem. Aliquam erat volutpat. Curabitur a lorem dapibus, placerat velit at, bibendum libero. Quisque quis orci vitae nulla ultrices lobortis interdum at quam."
        
        let blogCell = self.NSBlogs[indexPath.row]
        cell.tableNameText.text = blogCell.titlePost
        
        let str = blogCell.partTextBlog
        let substPartTextBlog = str!.substringWithRange(Range<String.Index>(start: (str?.startIndex.advancedBy(3))!, end: (str?.endIndex.advancedBy(-4))! ))

        cell.partText.text = substPartTextBlog

        return cell
    }
 
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("toDetail", sender: self)
        
    }
    
    
    
    
    @IBAction func barButtonAction(sender: UIBarButtonItem) {
        self.tableView.reloadData()
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let targetController = segue.destinationViewController as! DetailViewController
                targetController.blog = self.NSBlogs[indexPath.row]
            }
            
            
        }
        
    }
    
    
    
}











