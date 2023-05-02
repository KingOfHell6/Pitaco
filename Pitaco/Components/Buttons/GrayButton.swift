//
//  GrayButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import SwiftUI

struct GrayButton: View {
    var action : () -> Void
    var label: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.white)
                    .font(.system(size: 17, weight: .bold))
                    .background(Color("GrayButton"))
                    .cornerRadius(15)
            }
        }
    }
}

struct GrayButton_Previews: PreviewProvider {
    static func algo() {
        //
    }
    static var previews: some View {
        GrayButton(action: algo, label: "Botão cinza")
            .padding(.horizontal, 20)
    }
}
