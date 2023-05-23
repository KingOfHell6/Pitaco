//
//  UnsecureTextField.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI

struct EmailTextField: View {
    @Binding var text: String
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, maxHeight: 22, alignment: .leading)
                .padding(.leading, 18)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Color("TextFieldLabel"))

            HStack {
                TextField("", text: $text)
                    .padding(.horizontal, 18)
                    .textContentType(.emailAddress)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .submitLabel(.continue)
            }
            .frame(maxWidth: .infinity, minHeight: 50)
            .background(Color("TextField"))
            .cornerRadius(15)
        }
    }
}
