//
//  SimpleFormModel.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

class SimpleFormModel:ObservableObject {
    @Published var sections:[SimpleFormSection] = []
}
