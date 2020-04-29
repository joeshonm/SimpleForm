//
//  SimpleFormModel.swift
//  SimpleForm
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public class SimpleFormModel:ObservableObject {
    @Published public var sections:[SimpleFormSection] = []
    @Published public var isValid:Bool = false
}
