//
//  CustomSecureField.swift
//  handy0.2
//
//  Created by Shokri Alnajjar on 29/09/2022.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text: String
    let placeHolder: Text
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeHolder
                    .foregroundColor(Color(.init(white:1, alpha: 0.8)))
                    .padding(.leading,40)
            }
            
            HStack {
                Image(systemName: "lock")
                    .resizable()
                    .scaledToFit()
                    .frame(width:20,height: 20)
                    .foregroundColor(.white)
                
                SecureField("", text: $text)
            }
        }
    }
}


