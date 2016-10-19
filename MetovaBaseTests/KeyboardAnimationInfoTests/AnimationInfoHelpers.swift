//
//  KeyboardAnimationInfoTestHelpers.swift
//  MetovaBase
//
//  Created by Nick Griffith on 5/9/16.
//  Copyright © 2016 Metova. All rights reserved.
//

import UIKit

private func goodUserInfo() -> [AnyHashable: Any] {
    return [
        UIKeyboardFrameBeginUserInfoKey: CGRect.zero as AnyObject,
        UIKeyboardFrameEndUserInfoKey: CGRect.zero as AnyObject,
        UIKeyboardAnimationDurationUserInfoKey: 0,
        UIKeyboardAnimationCurveUserInfoKey: UIViewAnimationCurve.linear.rawValue,
        UIKeyboardIsLocalUserInfoKey: true
    ]
}

func keyboardNotification(name: String, missingKeys: [String]? = nil) -> Notification {
    var userInfo = goodUserInfo() as [AnyHashable: Any]
    
    missingKeys?.forEach { key in
        userInfo[key] = nil
    }
    
    return Notification(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
}
