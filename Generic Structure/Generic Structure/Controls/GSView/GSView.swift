//
//  GSView.swift
//  Generic Structure
//
//  Created by Afonso Rosa on 05/01/18.
//  Copyright © 2018 Afonso Rosa. All rights reserved.
//

import UIKit

class GSView: UIView {

    @IBOutlet var view: UIView!
    
    init(){
        super.init(frame: CGRect.zero)
        self.setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setupNib() {
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(self.view)
    }
    
    private func setup(){
        self.setupNib()
    }

}
