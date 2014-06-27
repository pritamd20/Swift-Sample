//
//  NextViewController.swift
//  SwiftTest
//
//  Created by Preetham Dsouza on 26/06/2014.
//  Copyright (c) 2014 company. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var nameLabel : UILabel
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
