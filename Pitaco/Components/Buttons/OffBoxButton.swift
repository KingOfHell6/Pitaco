//
//  OffBoxButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import SwiftUI

struct OffBoxButton: View {
    var action : () -> Void
    var label: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.blue)
                    .font(.system(size: 17, weight: .bold))
                    .background(.clear)
                    .cornerRadius(15)
            }
        }
    }
}

struct OffBoxButton_Previews: PreviewProvider {
    static func algo() {
        //
    }
    static var previews: some View {
        OffBoxButton(action: algo, label: "Botão sem cor de fundo")
            .padding(.horizontal, 20)
    }
}
