//
//  SimpleFormSection.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

public struct SimpleFormSection: View, Identifiable {
    public var id = UUID()
    var model:SimpleFormSectionModel = SimpleFormSectionModel()
    
    public var body: some View {
        Section {
            ForEach(self.model.fields, id: \.id) { field in
                field
            }
        }
    }
}

//struct SimpleFormSection_Previews: PreviewProvider {
//    static var previews: some View {
//        SimpleFormSection()
//    }
//}
