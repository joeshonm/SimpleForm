//
//  SimpleFormField.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

struct SimpleFormField: View, Identifiable {
    var id = UUID()
    @ObservedObject var model:SimpleFormFieldModel = SimpleFormFieldModel()
    
    init(textField label:String,name:String,value:Any) {
        self.model.type = .text
        self.model.label = label
        self.model.name = name
        self.model.value = value
    }
    
    init(pickerField label:String,name:String,selection:Int,options:Array<Any>, display:([Any]) -> AnyView) {
        self.model.type = .picker
        self.model.label = label
        self.model.name = name
        self.model.pickerSelection = selection
        self.model.options = options
        self.model.pickerDisplay = display(options)
    }
    
    
    
    
    var body: some View {
        Group {
            if self.model.type == .text {
                TextField(self.model.label, text: Binding(get: {
                    return self.model.value as! String
                }, set: { (newValue) in
                    self.model.value = newValue
                }))
            } else if(self.model.type == .picker) {
                Picker(selection: Binding(get: {
                    return self.model.pickerSelection
                }, set: { (newValue) in
                    self.model.pickerSelection = newValue
                    self.model.value = self.model.options[newValue]
                    print(self.model.value)
                }), label: Text("\(self.model.label)")) {
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