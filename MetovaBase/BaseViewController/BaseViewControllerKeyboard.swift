//
//  BaseViewControllerKeyboard.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//

import UIKit

extension BaseViewController: KeyboardNotificationDelegate {
    
    func addKeyboardNotifications() {
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillShow(_:)), forNotificationName: UIKeyboardWillShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidShow(_:)), forNotificationName: UIKeyboardDidShowNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillChange(_:)), forNotificationName: UIKeyboardWillChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidChange(_:)), forNotificationName: UIKeyboardDidChangeFrameNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardWillHide(_:)), forNotificationName: UIKeyboardWillHideNotification)
        register(selector: #selector(KeyboardNotificationDelegate.keyboardDidHide(_:)), forNotificationName: UIKeyboardDidHideNotification)
    }
    
    func removeKeyboardNotifications() {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidChangeFrameNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)
    }
    
    private func register(selector selector: Selector, forNotificationName name: String) {
        if respondsToSelector(selector) {
            NSNotificationCenter.defaultCenter().addObserver(self, selector: selector, name: name, object: nil)
        }
    }
}
