# SimpleForm

An easy way to build forms and return data in SwiftUI.

* [Installation](#installation)
* [Full Example](#full-example)

## Installation

SimpleForm is a swift package and can be installed using the Apple Developer guide below.

[How to add a Swift Package to your project.](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app)

## Full Example

```swift
import SwiftUI
import SimpleForm

struct ContentView: View {
    
    var jamForm = SF()
    var body: some View {
        
        // Section One
        let sectionOne = SimpleFormSection()
        sectionOne.model.fields.append(SimpleFormField(textField: "First Name", name: "first_name", value: ""))
        sectionOne.model.fields.append(SimpleFormField(textField: "Last Name", name: "last_name", value: ""))
        
        
        self.jamForm.model.sections.append(sectionOne)
        
        // Section Two
        let sectionTwo = SimpleFormSection()
        sectionTwo.model.fields.append(SimpleFormField(pickerField: "Greetings", name: "greeting", selection: 2, options: [1,13,24], display: { options in
            return  AnyView(
                
                List(0 ..< options.count) { row in
                    HStack {
                        Rectangle().fill(Color.black).frame(width: 100, height: 100)
                        Text("\(options[row] as! Int)").frame(minWidth:100)
                    }
                    
                }
                
            )
            
            
        }))
        
        self.jamForm.model.sections.append(sectionTwo)
        
        return NavigationView {
            jamForm
                .navigationBarTitle("Simple Form", displayMode: .inline)
                .navigationBarItems(trailing: Button(action: {
                    let formValues = self.jamForm.getValues()
                    print(formValues)
                }){
                    Text("Submit")
                })
        }
    }
}
```
