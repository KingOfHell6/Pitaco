//
//  GrayBlueButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct GrayBlueButton: View {
    var action : () -> Void
    var text: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(text)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.blue)
                    .font(.system(size: 17, weight: .bold))
                    .background(Color("GrayBlueButton"))
                    .cornerRadius(15)
            }
        }
    }
}

struct GrayBlueButton_Previews: PreviewProvider {
    static func algo() {
        //
    }
    static var previews: some View {
        GrayBlueButton(action: algo, text: "Botão cinza azulado")
    }
}
