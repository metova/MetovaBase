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
        UIResponder.keyboardFrameBeginUserInfoKey: CGRect.zero,
        UIResponder.keyboardFrameEndUserInfoKey: CGRect.zero,
        UIResponder.keyboardAnimationDurationUserInfoKey: 0 as TimeInterval,
        UIResponder.keyboardAnimationCurveUserInfoKey: UIView.AnimationCurve.linear.rawValue,
        UIResponder.keyboardIsLocalUserInfoKey: true
    ]
}

func keyboardNotification(name: String, missingKeys: [String]? = nil) -> Notification {
    var userInfo = goodUserInfo() as [AnyHashable: Any]
    
    missingKeys?.forEach { key in
        userInfo[key] = nil
    }
    
    return Notification(name: Notification.Name(rawValue: name), object: nil, userInfo: userInfo)
}
