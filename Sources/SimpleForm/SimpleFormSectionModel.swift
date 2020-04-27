//
//  SimpleFormSectionModel.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public class SimpleFormSectionModel:ObservableObject {
    @Published public var fields:[SimpleFormField] = []
}
