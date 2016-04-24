//
//  BaseViewController.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//
//

import UIKit

public class BaseViewController: UIViewController {

    deinit {
        removeKeyboardNotifications()
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardNotifications()
    }
}
