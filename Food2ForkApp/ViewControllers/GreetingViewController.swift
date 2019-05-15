//
//  GreetingViewController.swift
//  Food2ForkApp
//
//  Created by Michael Slattery on 14/05/2019.
//  Copyright © 2019 Michael Slattery. All rights reserved.
//

import UIKit

class GreetingViewController: UIViewController {

    @IBOutlet private weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goButton.setTitle(String.goButtonMessage, for: .normal)
    }
}

