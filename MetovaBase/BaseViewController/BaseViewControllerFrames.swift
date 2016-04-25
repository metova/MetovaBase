//
//  BaseViewControllerFrames.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//  Copyright (c) 2016 Metova Inc.
//
//  MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
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
