//
//  CustomTextField.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 29/09/2022.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    let imageName: String
    let placeHolder: Text
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color(.init(white:1, alpha: 0.8)))
                    .padding(.leading,40)
            }
            
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height: 20)
                    .foregroundColor(.white)
                
                TextField("", text: $text)
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""), imageName: "envelope", placeHolder:Text("Email") )
    }
}
