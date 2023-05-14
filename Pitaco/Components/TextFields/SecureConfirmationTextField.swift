//
//  SecureConfirmationTextField.swift
//  Pitaco
//
//  Created by Matheus Araújo on 07/05/23.
//

import SwiftUI

struct SecureConfirmationTextField: View {
    @Binding var text: String
    @Binding var isShowingPassword: Bool
    @Binding var isPasswordsEquals: Bool
    var isPasswordEmpty: Bool

    var body: some View {
        VStack {
            Text("Confirme sua senha")
                .frame(maxWidth: .infinity, maxHeight: 22, alignment: .leading)
                .offset(x: +18)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(Color("TextFieldLabel"))

            ZStack {
                ZStack {
                    TextField("", text: $text)
                        .padding(.horizontal, 18)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.default)
                        .opacity(isShowingPassword ? 1 : 0)

                    SecureField("", text: $text)
                        .padding(.horizontal, 18)
                        .textContentType(.password)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .keyboardType(.default)
                        .opacity(isShowingPassword ? 0 : 1)
                }
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color("TextField"))
                .cornerRadius(15)

                if !isPasswordEmpty {
                    VStack {
                        Image(systemName: isPasswordsEquals ? "equal.circle.fill" : "wrongwaysign.fill")
                            .symbolRenderingMode(.multicolor)
                            .padding(.trailing, 20)
                            .foregroundColor(isPasswordsEquals ? .green : .red)
                    }
                    .frame(maxWidth: .infinity ,alignment: .trailing)
                }
            }
        }
    }
}
