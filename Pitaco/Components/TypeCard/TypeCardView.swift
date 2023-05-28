//
//  TypeCardView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import SwiftUI

struct TypeCardView: View {
    @Binding var selected: PitacoType
    var type: PitacoType
    var title: String

    var body: some View {
        HStack {
            Button {
                selected = selected == type ? .other : type
            } label: {
                Image(systemName: type == selected ? "circle.fill" : "circle")
                    .font(.system(size: 24))
                    .padding(.horizontal, 37)
                    .foregroundColor(Color.primary)
            }

            Text(title)
                .font(.system(size: 24, weight: .bold))

            Spacer()
        }
        .frame(maxWidth: .infinity, minHeight: 171)
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(type == selected ? .blue : Color("TypeCard"))
                .onTapGesture {
                    selected = selected == type ? .other : type
                }
        )
        .padding(.horizontal, 20)
        .cornerRadius(15)
    }
}
