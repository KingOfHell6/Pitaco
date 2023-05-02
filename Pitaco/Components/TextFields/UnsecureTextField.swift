//
//  UnsecureTextField.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI

struct UnsecureTextField: View {
    @Binding var text: String
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 22, alignment: .leading)
                .offset(x: +18, y: +6)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Color("TextFieldLabel"))

            HStack {
                TextField("", text: $text)
                    .padding(.horizontal, 18)
                    .textContentType(.password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .keyboardType(.default)
                    .submitLabel(.join)
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
            .background(Color("TextField"))
            .cornerRadius(15)
        }
    }
}
