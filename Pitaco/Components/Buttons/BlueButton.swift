//
//  BlueButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 30/04/23.
//

import SwiftUI

struct BlueButton: View {
    var action : () -> Void
    var label: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
                    .background(Color("BlueButton"))
                    .cornerRadius(15)
            }
        }
    }
}

struct BlueButton_Previews: PreviewProvider {
    static func algo() {
        //
    }
    static var previews: some View {
        BlueButton(action: algo, label: "Botão azul")
            .padding(.horizontal, 20)
    }
}
