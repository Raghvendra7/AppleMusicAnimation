//
//  ViewController.swift
//  AppleMusicEffect
//
//  Created by Raghv on 15/06/16.
//  Copyright © 2016 Raghv. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {

    private var skView: SKView!
    private var floatingCollectionScene: BubblesScene!
    //var array = ["Shipra","Shanky","Raghv","Aditya","Mayank","Nikhil","Nandini","Prerna","Zia","Amresh","Sidd","Adanan","Komal"]
    var array = ["Rock 'n Roll","Pop","Heavy Metal","Rap","Country","Punk","R & B","Jazz","Classical","Alternative","Soul","Hip Hop","Techno","Reggae"]
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .Done,
                target: self,
                action: #selector(ViewController.commitSelection)
            )
            navigationItem.leftBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .Redo,
                target: self,
                action: #selector(ViewController.getView)
            )
            getView()
            
        }
        
        
        func getView(){
            skView = SKView(frame: UIScreen.mainScreen().bounds)
            skView.backgroundColor = SKColor.whiteColor()
            view.addSubview(skView)
            
            floatingCollectionScene = BubblesScene(size: skView.bounds.size)
            let navBarHeight = CGRectGetHeight(navigationController!.navigationBar.frame)
            let statusBarHeight = CGRectGetHeight(UIApplication.sharedApplication().statusBarFrame)
            floatingCollectionScene.topOffset = navBarHeight + statusBarHeight
            skView.presentScene(floatingCollectionScene)
            
            for i in 0..<array.count {
                let node = BubbleNode.instantiate(array[i])
                floatingCollectionScene.addChild(node)
            }
        }
        dynamic private func commitSelection() {
            floatingCollectionScene.performCommitSelectionAnimation()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

