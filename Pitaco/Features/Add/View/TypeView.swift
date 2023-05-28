//
//  TypeView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import SwiftUI

struct TypeView: View {
    @StateObject var addVM: AddViewModel
    @Binding var isShowingAddView: Bool

    var body: some View {
        VStack(alignment: .center, spacing: 21) {
            Spacer()

            Text("A opinião é de um filme ou série?")
                .font(.system(size: 36, weight: .bold))
                .frame(maxWidth: .infinity, minHeight: 100)
                .foregroundColor(Color("BlueButton"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
                .padding(.bottom, 25)

            TypeCardView(selected: $addVM.type, type: .movie, title: "Filme")

            TypeCardView(selected: $addVM.type, type: .tvShow, title: "Série")

            Spacer()
            Spacer()

            NavigationLink {
                FormView(addVM: addVM, isShowingAddView: $isShowingAddView)
            } label: {
                Text("Continuar")
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .foregroundColor(addVM.type == .other ? Color("DisabledText") : .white)
                    .font(.system(size: 17, weight: .bold))
                    .background(addVM.type == .other ? Color("DisabledButton") : Color("BlueButton"))
                    .cornerRadius(15)
            }
            .padding(.horizontal, 20)
            .buttonStyle(.borderless)
            .disabled(addVM.type == .other ? true : false)

        }
        .navigationTitle("Adicionar pitaco")
        .navigationBarTitleDisplayMode(.inline)
        .padding(.bottom, 20)
    }
}

struct TypeView_Previews: PreviewProvider {
    static var previews: some View {
        TypeView(addVM: AddViewModel(), isShowingAddView: .constant(true))
    }
}
