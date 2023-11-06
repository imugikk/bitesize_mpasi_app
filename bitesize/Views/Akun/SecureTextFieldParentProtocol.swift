//
//  SecureTextFieldParentProtocol.swift
//  bitesize
//
//  Created by Michelle Annice on 07/11/23.
//

import Foundation

/// Properties and functionalities to assign and  perform in the parent view of the SecuredTextFieldView.
protocol SecuredTextFieldParentProtocol {
    
    /// Assign SecuredTextFieldView hideKeyboard method to this and
    /// then parent can excute it when needed..
    var hideKeyboard: (() -> Void)? { get set }
}
