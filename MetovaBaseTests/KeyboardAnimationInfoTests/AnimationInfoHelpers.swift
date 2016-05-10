//
//  KeyboardAnimationInfoTestHelpers.swift
//  MetovaBase
//
//  Created by Nick Griffith on 5/9/16.
//  Copyright © 2016 Metova. All rights reserved.
//

import UIKit

private func goodUserInfo() -> [NSObject: AnyObject] {
    return [
        UIKeyboardFrameBeginUserInfoKey: NSValue(CGRect: CGRect.zero),
        UIKeyboardFrameEndUserInfoKey: NSValue(CGRect: CGRect.zero),
        UIKeyboardAnimationDurationUserInfoKey: 0,
        UIKeyboardAnimationCurveUserInfoKey: UIViewAnimationCurve.Linear.rawValue,
        UIKeyboardIsLocalUserInfoKey: true
    ]
}

func keyboardNotification(name name: String, missingKeys: [String]? = nil) -> NSNotification {
    var userInfo = goodUserInfo() as [NSObject: AnyObject]
    
    missingKeys?.forEach { key in
        userInfo[key] = nil
    }
    
    return NSNotification(name: name, object: nil, userInfo: userInfo)
}
