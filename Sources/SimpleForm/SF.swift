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
    
    public init() {
        
    }
    
    public func isValid() -> Bool {
        let errors:[Bool] = []
        
        for section in self.model.sections {
            let fields = section.model.fields
            
            
            for field in fields {
                
                if (field.model.validation.count > 0) {
                    field.model.errors.removeAll()
                    
                    let range = NSRange(location: 0, length: (field.model.value as! String).utf16.count)
                    let regex = try! NSRegularExpression(pattern: #"[a-z0-9]+([-+._][a-z0-9]+){0,2}@.*?(\.(a(?:[cdefgilmnoqrstuwxz]|ero|(?:rp|si)a)|b(?:[abdefghijmnorstvwyz]iz)|c(?:[acdfghiklmnoruvxyz]|at|o(?:m|op))|d[ejkmoz]|e(?:[ceghrstu]|du)|f[ijkmor]|g(?:[abdefghilmnpqrstuwy]|ov)|h[kmnrtu]|i(?:[delmnoqrst]|n(?:fo|t))|j(?:[emop]|obs)|k[eghimnprwyz]|l[abcikrstuvy]|m(?:[acdeghklmnopqrstuvwxyz]|il|obi|useum)|n(?:[acefgilopruz]|ame|et)|o(?:m|rg)|p(?:[aefghklmnrstwy]|ro)|qa|r[eosuw]|s[abcdeghijklmnortuvyz]|t(?:[cdfghjklmnoprtvwz]|(?:rav)?el)|u[agkmsyz]|v[aceginu]|w[fs]|y[etu]|z[amw])\b){1,2}"#)
                    let validationResult = regex.firstMatch(in: (field.model.value as! String), options: [], range: range) != nil
                    
                    if (validationResult) {
                        field.model.errors.append("Please enter a valid email address.")
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
