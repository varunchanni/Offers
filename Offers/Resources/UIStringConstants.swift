//
//  UIStringConstants.swift
//  DealsApp
//
//  Created by Varun Channi on 22/06/17.
//  Copyright © 2017 Nagarro. All rights reserved.
//

import Foundation

extension String {
    func localizedString() -> String {
        return Bundle.main.localizedString(forKey: self, value: nil, table: nil)
    }
}

// MARK: Error strings
let errorEmailId                = "error_invalid_email".localizedString()
let errorUnableProcessData      = "invalid_json".localizedString()
let errorInvalidPassword        = "alert_password_requirement".localizedString()
let alertPasswordExpireString   = "alert_password_expire".localizedString()
let alertSessionExpireString    = "alert_session_expire".localizedString()
let errorInvalidUser            = "invalid_user".localizedString()
let errorInvalidPin             = "invalid_pin".localizedString()
let errorNetwork                = "alert_reachibility".localizedString()
let errorAllFieldNotEntered     = "error_all_feild_mendatory".localizedString()
let errorPasswordMismatch       = "error_password_mismatch".localizedString()
let errorInvalidImages          = "invalid_images".localizedString()
