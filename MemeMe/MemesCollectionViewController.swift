//
//  MemesCollectionViewController.swift
//  MemeMe
//
//  Created by Sebastian Drew on 9/2/15.
//  Copyright (c) 2015 los. All rights reserved.
//

import UIKit

class MemesCollectionViewController: UICollectionViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
   // @IBOutlet var savedMemesCollectionView: UICollectionView!
    // @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    @IBOutlet var savedMemesCollectionView: UICollectionView!
    
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let object = UIApplication.sharedApplication().delegate
        let appDelegate = object as! AppDelegate
        memes = appDelegate.memes
        
        tabBarController?.tabBar.hidden = false
        UIApplication.sharedApplication().statusBarHidden = false
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        savedMemesCollectionView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        
        memes = applicationDelegate.memes
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
        
        configureView()
        
    }
    
    func configureView() {
        
        if let navBarFont = UIFont(name: "HelveticaNeue-Thin", size: 20.0) {
            let navBarAttributesDictionary: [NSObject: AnyObject]? = [
                NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: navBarFont
            ]
            navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
        }
    }
    
    // MARK: Collection View Data Source
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
        
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let meme = memes[indexPath.row]
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemesCollectionViewCell", forIndexPath: indexPath) as! MemesCollectionViewCell
        
        cell.memeImage.image = meme.memedImage
        
        return cell
    }

    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard?.instantiateViewControllerWithIdentifier("MemeDetailViewController") as! MemeDetailViewController
        detailController.meme = self.memes[indexPath.row]
        navigationController?.pushViewController(detailController, animated: true)
    }    
    
}