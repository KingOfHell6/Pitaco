//
//  GrayBlueButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct GrayBlueButton: View {
    var action : () -> Void
    var label: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(label)
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
        GrayBlueButton(action: algo, label: "Botão cinza azulado")
            .padding(.horizontal, 20)
    }
}
