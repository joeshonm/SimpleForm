//
//  SimpleForm.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public struct SF: View {
    @ObservedObject public var model:SimpleFormModel = SimpleFormModel()
    
    public init() {
        
    }
    
    public func getValues() -> Dictionary<String, Any> {
        var values:[String:Any] = [:]
        
        for section in self.model.sections {
            let fields = section.model.fields
            
            for field in fields {
                values[field.model.name] = field.model.value
            }
        }
        
        return values
    }
    
    public var body: some View {
        Form {
            ForEach(self.model.sections, id: \.id) { jamFormSection in
                jamFormSection
            }
        }.onAppear {
            UITableView.appearance().separatorStyle = .none
        }
    }
}

//struct SimpleForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleForm()
//    }
//}
