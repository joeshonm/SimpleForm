//
//  SimpleFormFieldModel.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

class SimpleFormFieldModel:ObservableObject {
    @Published var type:SimpleFormFieldType = .text
    @Published var label:String = ""
    @Published var name:String = ""
    @Published var value:Any = ""
    @Published var pickerSelection:Int = 0
    @Published var options:[Any] = []
    @Published var pickerDisplay:AnyView = AnyView(EmptyView())
}
