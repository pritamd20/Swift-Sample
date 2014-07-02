//
//  NextViewController.swift
//  SwiftTest
//
//  Created by Preetham Dsouza on 26/06/2014.
//  Copyright (c) 2014 company. All rights reserved.
//

import UIKit
import Foundation

class NextViewController: UIViewController {

    @IBOutlet var nameLabel : UILabel
    @IBOutlet var nameTextField : UITextField
    @IBOutlet var trackNameTextField : UITextField
    @IBOutlet var priceTextField : UITextField

    
    
    var artWork:ArtWork!
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        
        super.init(coder: aDecoder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameLabel.text = artWork.artistName
        
        self.nameTextField.text = artWork.artistName
        self.trackNameTextField.text = artWork.trackName
        self.priceTextField.text = artWork.collectionPrice
        
        let documentsPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        let dbPath = documentsPaths.stringByAppendingPathComponent("contact.db")
        let  DB_NAME : CString = dbPath.bridgeToObjectiveC().UTF8String
        //println(dbPath)
        
//        var db: COpaquePointer = nil;
//        
//        if sqlite3_open(dbPa , &db) != SQLITE_OK {
//            println("Failed to open file")
//            //exit(1)
//        }
//        else {
//            var sql = "CREATE TABLE IF NOT EXISTS CONTACTS (ID INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT, ADDRESS TEXT, PHONE TEXT)"
//            
//            var statement:COpaquePointer = nil
//            var tail: CString = ""
//            var error:Character?
//        }
        
        
        let db = SQLiteDB.sharedInstance()

        //let data = db. query (" SELECT name FROM sqlite_master WHERE type='table' AND name='my_table_name' ")
    
        db.execute("CREATE TABLE IF NOT EXISTS SONGS (ID INTEGER PRIMARY KEY AUTOINCREMENT, ARTIST_NAME TEXT, TRACK_NAME TEXT, COLLECTION_PRICE TEXT)")
        
        
        
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func insertButtonClicked(sender : AnyObject) {
        
//        var name = self.nameTextField.text
//        var track = self.trackNameTextField.text
//        var price = self.priceTextField.text
        let db = SQLiteDB.sharedInstance()

        db.execute("INSERT INTO SONGS (ARTIST_NAME,TRACK_NAME , COLLECTION_PRICE) VALUES ('\(self.nameTextField.text)','\(self.trackNameTextField.text)','\(self.priceTextField.text)') ")

        
        
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
