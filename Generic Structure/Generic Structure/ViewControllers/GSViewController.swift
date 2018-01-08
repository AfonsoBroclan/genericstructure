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
    
    //layout variables
    var bottomMargin : CGFloat = 0.0 //margin to be used in the calculateDistanceToLastElement
    
    //loading variables
    private var loadingCount = 0
    private var activityIndicator : UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createLoading()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Layout
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
    
    //MARK: Loading
    func startLoading() {
        self.loadingCount += 1
        //only needs to show the loading view once
        if self.loadingCount == 1 {
            self.showLoading()
        }
    }
    
    func stopLoading() {
        if self.loadingCount > 0 {
            self.loadingCount -= 1
            //only needs to hide the loading view once
            if self.loadingCount == 0 {
                self.hideLoading()
            }
        }
    }
    
    private func showLoading() {
        self.activityIndicator?.startAnimating()
        self.activityIndicator?.isHidden = false
    }
    
    private func hideLoading() {
        self.activityIndicator?.stopAnimating()
        self.activityIndicator?.isHidden = true
    }
    
    private func createLoading() {
        //if it already exists, no need to recreate it
        if let _ = self.activityIndicator {
            return
        }
        
        //if it doesn't exist, create a new with the view controller frame
        self.activityIndicator = UIActivityIndicatorView.init(frame: self.view.frame)
        
        self.activityIndicator?.clipsToBounds = true
        self.activityIndicator?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.activityIndicator?.isHidden = true
        self.activityIndicator?.color = .black
        
        if let activityIndicator = self.activityIndicator {
            self.view.addSubview(activityIndicator)
        }
    }
    
}
