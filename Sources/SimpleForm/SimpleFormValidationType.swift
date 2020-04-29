//
//  SimpleFormValidationType.swift
//  SimpleForm
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public enum SimpleFormValidationType {
    case required
    case email
    case regex(String, String)
}
