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
    
    public var body: some View {
        Form {
            ForEach(self.model.sections, id: \.id) { jamFormSection in
                jamFormSection
            }
        }
    }
}

//struct SimpleForm_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleForm()
//    }
//}