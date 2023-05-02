//
//  WhiteButton.swift
//  Pitaco
//
//  Created by Matheus Araújo on 01/05/23.
//

import SwiftUI

struct WhiteButton: View {
    var action : () -> Void
    var label: String

    var body: some View {
        VStack {
            Button {
                action()
            } label: {
                Text(label)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .bold))
                    .background(Color("WhiteButton"))
                    .cornerRadius(15)
            }
        }
    }
}

struct WhiteButton_Previews: PreviewProvider {
    static func algo() {
        //
    }
    static var previews: some View {
        WhiteButton(action: algo, label: "Botão branco")
            .padding(.horizontal, 20)
    }
}
