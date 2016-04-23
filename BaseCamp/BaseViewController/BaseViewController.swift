//
//  BaseViewController.swift
//  BaseCamp
//
//  Created by Nick Griffith on 4/22/16.
//
//

public class BaseViewController: UIViewController {

    deinit {
        removeKeyboardNotifications()
    }
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        addKeyboardNotifications()
    }
}
