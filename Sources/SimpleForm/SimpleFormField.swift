//
//  SimpleFormField.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public struct SimpleFormField: View, Identifiable {
    public var id = UUID()
    @ObservedObject public var model:SimpleFormFieldModel = SimpleFormFieldModel()
    
    public init(textField label:String, labelPosition:SimpleFormFieldLabelPosition = .placeholder, name:String,value:Any) {
        self.model.type = .text
        self.model.label = label
        self.model.labelPosition = labelPosition
        self.model.name = name
        self.model.value = value
    }
    
    public init(pickerField label:String, labelPosition:SimpleFormFieldLabelPosition = .placeholder, name:String,selection:Int,options:Array<Any>, display:([Any]) -> AnyView) {
        self.model.type = .picker
        self.model.label = label
        self.model.labelPosition = labelPosition
        self.model.name = name
        self.model.pickerSelection = selection
        self.model.options = options
        self.model.pickerDisplay = display(options)
        self.model.value = self.model.options[selection]
    }
    
    
    
    
    public var body: some View {
        
        Group {
            
            if self.model.labelPosition == .above {
                Text(self.model.label)
            }
            if self.model.type == .text {
                TextField(self.model.labelPosition == .placeholder ? self.model.label : "", text: Binding(get: {
                    return self.model.value as! String
                }, set: { (newValue) in
                    self.model.value = newValue
                }))
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .padding(.all, 5)
                    .textFieldStyle(PlainTextFieldStyle())
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
            } else if(self.model.type == .picker) {
                Picker(selection: Binding(get: {
                    return self.model.pickerSelection
                }, set: { (newValue) in
                    self.model.pickerSelection = newValue
                    self.model.value = self.model.options[newValue]
                }), label: Text("\(self.model.labelPosition == .placeholder ? self.model.label : "")")) {
                    self.model.pickerDisplay
                }
            } else {
                EmptyView()
            }
        }
        
    }
}

//struct SimpleFormField_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleFormField()
//    }
//}
