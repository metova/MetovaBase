//
//  NotificationHelper.swift
//  BaseCamp
//
//  Created by Nick Griffith on 4/23/16.
//
//

import UIKit

func keyboardFrameBeginNotificationNoUserInfo() -> NSNotification {
    return NSNotification(name: UIKeyboardFrameBeginUserInfoKey, object: nil)
}

func keyboardFrameEndNotificationNoUserInfo() -> NSNotification {
    return NSNotification(name: UIKeyboardFrameEndUserInfoKey, object: nil)
}

func keyboardFrameBeginNotification(beginFrame beginFrame: CGRect?, endFrame: CGRect?) -> NSNotification {
    return frameNotification(UIKeyboardFrameBeginUserInfoKey, beginFrame: beginFrame, endFrame: endFrame)
}

func keyboardFrameEndNotification(beginFrame beginFrame: CGRect?, endFrame: CGRect?) -> NSNotification {
    return frameNotification(UIKeyboardFrameEndUserInfoKey, beginFrame: beginFrame, endFrame: endFrame)
}

private func frameNotification(name: String, beginFrame: CGRect?, endFrame: CGRect?) -> NSNotification {
    var userInfo = [String: AnyObject]()
    
    if let beginFrame = beginFrame {
        userInfo[UIKeyboardFrameBeginUserInfoKey] = NSValue(CGRect: beginFrame)
    }
    
    if let endFrame = endFrame {
        userInfo[UIKeyboardFrameEndUserInfoKey] = NSValue(CGRect: endFrame)
    }
    
    return NSNotification(name: name, object: nil, userInfo: userInfo)
}
