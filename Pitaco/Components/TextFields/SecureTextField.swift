//
//  SecureTextField.swift
//  Pitaco
//
//  Created by Matheus Araújo on 02/05/23.
//

import SwiftUI

struct SecureTextField: View {
    @Binding var text: String
    @Binding var isShowingPassword: Bool
    var title: String
    
    var body: some View {
        VStack {
            Text(title)
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

                VStack {
                    Button {
                        self.isShowingPassword.toggle()
                    } label: {
                        Image(systemName: isShowingPassword ? "eye.fill" : "eye.slash.fill")
                            .symbolRenderingMode(.multicolor)
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 20)
                }
                .frame(maxWidth: .infinity ,alignment: .trailing)
            }
        }
    }
}
