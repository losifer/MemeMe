//
//  MemesDetailViewController.swift
//  MemeMe
//
//  Created by Sebastian Drew on 8/31/15.
//  Copyright (c) 2015 los. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    var meme: Meme!
    
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var memeImageDetail: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        memeImageDetail.image = meme.memedImage
        tabBarController?.tabBar.hidden = true
        shareButton.layer.cornerRadius = 6
    }
    
    @IBAction func shareButtonDidTouch(sender: AnyObject) {
        
        let activityViewController = UIActivityViewController(activityItems: [meme.memedImage], applicationActivities: nil)
            activityViewController.completionWithItemsHandler = {
                (s: String!, ok: Bool, items: [AnyObject]!, err:NSError!) -> Void in
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            presentViewController(activityViewController, animated: true, completion: nil)
        }
    
}

