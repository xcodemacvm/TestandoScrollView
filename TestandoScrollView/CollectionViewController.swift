//
//  CollectionViewController.swift
//  TestandoScrollView
//
//  Created by A1 on 17/12/17.
//  Copyright © 2017 A1. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var multiplier = 1
    var indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    var button = UIButton(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .yellow
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        indicator.center.x = view.center.x
        indicator.center.y = -30
        collectionView?.addSubview(indicator)
        indicator.startAnimating()
        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
  //      collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView?.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        button.titleLabel?.text = "TESTE!"
        button.backgroundColor = UIColor.yellow
        button.addTarget(nil, action: #selector(tapButton(sender:)), for: UIControlEvents.touchUpInside)
        collectionView?.addSubview(button)
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(sender: UIButton) {
        print("Oi")
        
        collectionView?.setContentOffset(CGPoint(x: 0, y: -20), animated: true)
        collectionView?.scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//        collectionView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)

    }
    
    override func scrollViewDidChangeAdjustedContentInset(_ scrollView: UIScrollView) {
        print("tranqueira")
      //  collectionView?.setContentOffset(CGPoint.zero , animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        
        return 4*multiplier
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .red
        
        // Configure the cell
    
        return cell
    }

    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
     //   multiplier += 1
     //   collectionView?.reloadData()
     //   print("cells: \(multiplier*4)")
        print("contentSize: \(collectionView?.contentSize)")
        print("contentOffset: \(collectionView?.contentOffset)")
        print("screenHeight: \(UIScreen.main.bounds.height)")
        
        
        if (collectionView?.contentOffset.y)! + UIScreen.main.bounds.height == collectionView?.contentSize.height {
            multiplier += 1
            collectionView?.reloadData()
        }
    }
    
    
    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
