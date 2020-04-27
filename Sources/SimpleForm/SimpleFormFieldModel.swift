//
//  SimpleFormFieldModel.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public class SimpleFormFieldModel:ObservableObject {
    @Published public var type:SimpleFormFieldType = .text
    @Published public var label:String = ""
    @Published public var name:String = ""
    @Published public var value:Any = ""
    @Published public var pickerSelection:Int = 0
    @Published public var options:[Any] = []
    @Published public var pickerDisplay:AnyView = AnyView(EmptyView())
}
