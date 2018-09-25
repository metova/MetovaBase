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
        UIKeyboardFrameBeginUserInfoKey: CGRect.zero,
        UIKeyboardFrameEndUserInfoKey: CGRect.zero,
        UIKeyboardAnimationDurationUserInfoKey: 0 as TimeInterval,
        UIKeyboardAnimationCurveUserInfoKey: UIView.AnimationCurve.linear.rawValue,
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
