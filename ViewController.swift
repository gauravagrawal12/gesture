//
//  ViewController.swift
//  Day10today
//
//  Created by Felix 09 on 17/08/19.
//  Copyright © 2019 Felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rotate = UIRotationGestureRecognizer(target: self, action: #selector(rotatedView(_sender:)))
        view.addGestureRecognizer(rotate)
    
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        
        let leftswipe = UISwipeGestureRecognizer(target: self, action: #selector(handleleftSwipe(sender:)))
        leftswipe.direction = .left
        view.addGestureRecognizer(leftswipe)
        
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handlerightswipe(sender:)))
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGesture))
        self.view.addGestureRecognizer(panGesture)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    @objc func handleTap(sender:UITapGestureRecognizer){
        view.backgroundColor = .red
    }
    
    @objc func handleleftSwipe(sender:UITapGestureRecognizer){
        view.backgroundColor = .yellow
    }
    
    @objc func handlerightswipe(sender:UITapGestureRecognizer){
        view.backgroundColor = .green
    }
    
    func rotatePiece(_gestureRecognizer : UIRotationGestureRecognizer){
        guard _gestureRecognizer.view != nil else { return }
        
        if _gestureRecognizer.state == .began || _gestureRecognizer.state == .changed {
            _gestureRecognizer.view?.transform = _gestureRecognizer.view!.transform.rotated(by: _gestureRecognizer.rotation)
            _gestureRecognizer.rotation = 0
        }
    }
    
    @objc func rotatedView(_sender:UIRotationGestureRecognizer){
        print("rotation gesture is detected")
    }
    
    @objc func panGesture(sender: UIPanGestureRecognizer){
        let point = sender.location(in: view)
        let panGesture = sender.view
        panGesture?.center = point
        print(point)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

