//
//  BaseViewControllerConvenience.swift
//  MetovaBase
//
//  Created by Nick Griffith on 4/22/16.
//
//

extension BaseViewController {

    /**
     Dismisses the keyboard if it has been presented by this view controller.
     */
    public func dismissKeyboard() {
        
        view.endEditing(true)
    }
}
