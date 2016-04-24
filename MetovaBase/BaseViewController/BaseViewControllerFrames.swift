//
//  BaseViewControllerFrames.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//
//

import UIKit

extension BaseViewController {
    
    /**
     Parses keyboard frames out of keyboard notification.
     
     - parameter notification: Keyboard natification
     
     - returns: Tuple with start and end frames
     */
    public func framesForKeyboardNotification(notification: NSNotification) -> (fromFrame: CGRect, toFrame: CGRect) {
        guard let userInfo = notification.userInfo else { return (CGRect.zero, CGRect.zero) }
        
        let fromFrame = userInfo[UIKeyboardFrameBeginUserInfoKey]?.CGRectValue() ?? CGRect.zero
        let toFrame = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue() ?? CGRect.zero
        
        return (fromFrame, toFrame)
    }
    
    /**
     A subclass may use this convenience method to adjust a scroll view's bottom content inset to account for the keyboard whenever the keyboardWillChangeFrame method is called.
     
     - parameter scrollView:   The scroll view to adjust.
     - parameter notification: The notification for keyboardWillChangeFrame.
     */
    public func adjustContentInset(scrollview scrollView: UIScrollView, forKeyboardWillChangeFrameNotification notification: NSNotification) {
        
        if let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrameEnd = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue() {
            
            var scrollViewDistanceToBottomOfWindow: CGFloat = 0
            
            if let window = view.window {
                let rectInWindow = window.convertRect(scrollView.frame, fromView: scrollView.superview)
                scrollViewDistanceToBottomOfWindow = CGRectGetHeight(window.frame) - CGRectGetHeight(rectInWindow) - rectInWindow.origin.y
            }
            
            var inset = scrollView.contentInset
            inset.bottom = max(0.0, UIScreen.mainScreen().bounds.size.height - keyboardFrameEnd.origin.y - scrollViewDistanceToBottomOfWindow)
            scrollView.contentInset = inset
            scrollView.scrollIndicatorInsets = scrollView.contentInset
        }
    }
}
