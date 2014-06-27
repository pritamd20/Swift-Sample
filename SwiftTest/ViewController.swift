//
//  ViewController.swift
//  SwiftTest
//
//  Created by Preetham Dsouza on 13/06/2014.
//  Copyright (c) 2014 company. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate{
    
    @IBOutlet var tableView : UITableView
    @IBOutlet var searchBar : UISearchBar
    
    var items:ArtWork[] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
 
        
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func searchBarSearchButtonClicked(searchBar: UISearchBar!){
        println( searchBar.text )
        
        searchBar.resignFirstResponder()
        
        
        serverCall(searchBar.text)
       
      // comment server call & uncomment below code : the result will be same .
        
    /**
        var urlString = "http://itunes.apple.com/search?term=\(searchBar.text)"
        println(urlString )
        let url = NSURL.URLWithString(urlString)
        var request = NSURLRequest (URL: url)
    
        
        
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) in
            println(NSString(data: data, encoding: NSUTF8StringEncoding))
            
            
        
       //var json : AnyObject! = NSKeyedUnarchiver.unarchiveObjectWithData(data) as AnyObject
        let jsonObject : NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
   
            println(jsonObject)
            
           let json : AnyObject! = jsonObject["results"] as AnyObject
            let rawArray = json as NSArray
            self.items.removeAll(keepCapacity: false)
            
            for temDic : AnyObject in rawArray{
            
                var dic:NSDictionary = temDic as NSDictionary
                
               let obj = ArtWork (trackName: dic["trackName"]as String,artistName: dic["artistName"] as String)
                
                println("--------\(obj.artistName)")

                self.items.append(obj)
            
            }

            self.tableView.reloadData()
        }
        
        
        **/

    }
    
    
    
    
    
    func serverCall(keyword:String) {
        
        
      println(  NSThread.currentThread())
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        
        dispatch_async(dispatch_get_global_queue(priority, 0), { ()->() in
            println("gcd hello")
            println(  NSThread.currentThread())

            var urlString = "http://itunes.apple.com/search?term=\(keyword)"
            println(urlString )
            let url = NSURL.URLWithString(urlString)
            var request = NSURLRequest (URL: url)
            
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue()) { (response, data, error) in
                
               // println(NSString(data: data, encoding: NSUTF8StringEncoding))
                
                
                
                let jsonObject : NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                
                println(jsonObject)
                
                let json : AnyObject! = jsonObject["results"] as AnyObject
                let rawArray = json as NSArray
                self.items.removeAll(keepCapacity: false)
                
                for temDic : AnyObject in rawArray{
                    
                    var dic:NSDictionary = temDic as NSDictionary
                    
                    let obj = ArtWork (trackName: dic["trackName"]as String, artistName: dic["artistName"] as String,artworkUrl:dic["artworkUrl100"] as String)
                    
                    println("--------\(obj.artistName)")
                    
                    self.items.append(obj)
                    
                }
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    println("hello from UI thread executed as dispatch22")

                    println(  NSThread.currentThread())

                    self.tableView.reloadData()

                    
                    

                    })
                
            }
    
  
            })
        println("hello from UI thread")
        
        
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 80
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
         return self.items.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
         var obj1 = self.items[indexPath.row] as ArtWork
        
        cell.textLabel.text = obj1.artistName
        cell.imageView.image = UIImage(named: "paceholder.png")
        
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT

        dispatch_async(dispatch_get_global_queue(priority, 0), { ()->() in
            
            var imageUrlString = obj1.artworkUrl
            let imageUrl = NSURL.URLWithString(imageUrlString)
            var imageRequest = NSURLRequest (URL: imageUrl)
            
            
            NSURLConnection.sendAsynchronousRequest(imageRequest, queue: NSOperationQueue()) { (response, data, error) in
                
                //println(NSString(data: data, encoding: NSUTF8StringEncoding))
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    cell.imageView.image = UIImage(data: data)
                    println("imgcall")
                    })
            }
        
        
        })
            
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        println("You selected cell #\(indexPath.row)!")
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var obj1 = self.items[indexPath.row] as ArtWork
        

       // self.navigationController.performSegueWithIdentifier("NextView", sender: nil)
       // var nib :String = "NextViewController"
        
     let nextView = self.storyboard.instantiateViewControllerWithIdentifier("NextViewController") as NextViewController

        nextView.artWork = obj1
        
       //var secondViewController = NextViewController(nibName: "SH8-q0-Leg", bundle: nil)
        self.navigationController.pushViewController(nextView, animated:true )
        
        
    }
    

}



