//
//  SimpleFormView.swift
//  SimpleFormExample
//
//  Created by JoeShon Monroe on 4/26/20.
//  Copyright © 2020 JoeShon Monroe. All rights reserved.
//

import SwiftUI

struct SimpleFormView: View {
    @ObservedObject var model:SimpleFormModel = SimpleFormModel()
    var body: some View {
        Form {
            ForEach(self.model.sections, id: \.id) { jamFormSection in
                jamFormSection
            }
        }
    }
}

struct SimpleForm_Previews: PreviewProvider {
    static var previews: some View {
        SimpleForm()
    }
}
