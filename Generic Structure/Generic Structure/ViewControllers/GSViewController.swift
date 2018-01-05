//
//  GSViewController.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 05/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import UIKit

class GSViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var distanceToLastElement: NSLayoutConstraint!
    
    var bottomMargin : CGFloat = 0.0 //margin to be used in the calculateDistanceToLastElement

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Helpers
    func calculateDistanceToLastElement() {
        
        //make sure the scrollView and distanteToLastElement outlets exist
        guard let scrollView = self.scrollView else { return }
        
        guard let distanceToLastElement = self.distanceToLastElement else { return }
        
        //if the contentSize and the frame are the same, no need to recalculate
        if scrollView.contentSize.height == scrollView.frame.height { return }
        
        self.view.setNeedsDisplay()
        distanceToLastElement.constant = 0
        self.view.layoutIfNeeded()
        
        //if the scroll view doesn't occupy the whole view, add space between the last two elements
        if scrollView.contentSize.height < scrollView.frame.height && scrollView.contentSize.height != 0 {
            let distance = scrollView.frame.height - scrollView.contentSize.height
            distanceToLastElement.constant = distance
            self.view.setNeedsLayout()
        } else if scrollView.contentSize.height > scrollView.frame.height && scrollView.contentSize.height != 0 {
            //if the scroll view is bigger than the view, add a margin between the last two elements
            distanceToLastElement.constant = self.bottomMargin
            self.view.setNeedsLayout()
        }
    }
}
