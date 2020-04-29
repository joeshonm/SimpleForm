//
//  SimpleForm.swift
//  SimpleForm
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public struct SF: View {
    @ObservedObject public var model:SimpleFormModel = SimpleFormModel()
    let validator = SimpleFormValidation()
    public init() {
        
    }
    
    public func isValid() -> Bool {
        var errors:[Bool] = []
        
        for section in self.model.sections {
            let fields = section.model.fields
            
            
            for field in fields {
                
                if (field.model.validation.count > 0) {
                    field.model.errors.removeAll()
                    
                    for validation in field.model.validation {
                        switch validation {
                        case .email:
                            if (validator.validateEmail(value: field.model.value) == false) {
                                errors.append(false)
                                field.model.errors.append("Please enter a valid email address.")
                            }
                        case .required:
                            if (validator.validateEmpty(value: field.model.value) == false) {
                                errors.append(false)
                                field.model.errors.append("This field is required.")
                            }
                        default:
                            ()
                        }
                    }

                    
                }
                
            }
            
            
        }
        
        if errors.count > 0 {
            self.model.isValid = false
            return false
        } else {
            self.model.isValid = true
            return true
        }
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
        }
        .onAppear {
            UITableView.appearance().backgroundColor = .clear
            UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
            UITableView.appearance().tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().layoutMargins = UIEdgeInsets.zero
            UITableView.appearance().sectionHeaderHeight = 0
        }
    }
}

//struct SimpleForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleForm()
//    }
//}
