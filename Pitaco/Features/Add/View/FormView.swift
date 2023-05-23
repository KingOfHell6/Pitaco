//
//  AddView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 14/05/23.
//

import SwiftUI

struct FormView: View {
    @StateObject var addVM: AddViewModel
    @Binding var isShowingAddView: Bool

    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("Título", text: $addVM.title)
                } header: {
                    Text(addVM.type == .movie ? "Título do filme" : "Título da série")
                }

                Section {
                    Picker("Gênero", selection: $addVM.genre) {
                        ForEach(PitacoGenre.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                } header: {
                    Text(addVM.type == .movie ? "Gênero do filme" : "Gênero da série")
                }

                Section {
                    Picker("Streaming", selection: $addVM.streaming) {
                        ForEach(PitacoStreaming.allCases, id: \.self) {
                            Text($0.rawValue).tag($0)
                        }
                    }
                } header: {
                    Text("Streaming em que assitiu")
                }

                Section {
                    TextEditor(text: $addVM.pitaco)
                } header: {
                    Text(addVM.type == .movie ? "Review do filme" : "Review da série")
                }

                Section {
                    RatingView(rating: $addVM.rating)
                } header: {
                    Text(addVM.type == .movie ? "Nota do filme" : "Nota da série")
                }

                Section {
                    Toggle("Público", isOn: $addVM.isPublic)
                } header: {
                    Text("Compartilhar seu pitaco com a comunidade?")
                }
            }

            BlueButton(action: {
                addVM.savePitaco()
            }, label: "Salvar pitaco")
            .padding(.horizontal, 20)

//            NavigationLink {
//                //                ImageView(addVM: addVM, isShowingAddView: $isShowingAddView)
//                EmptyView()
//            } label: {
//                Text("Continuar")
//                    .frame(maxWidth: .infinity, minHeight: 40)
//                    .font(.system(size: 17, weight: .bold))
//            }
//            .padding(.vertical, 0)
//            .padding(.horizontal, 20)
//            .buttonStyle(.borderedProminent)
//            .tint(Color("BlueButton"))
//            .cornerRadius(15)
//            .disabled(
//                addVM.title.isEmpty
//                || addVM.genre == .other
//                || addVM.streaming == .other
//                || addVM.pitaco.isEmpty
//                || addVM.rating == 0 ? true : false
//            )
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(addVM: AddViewModel(), isShowingAddView: .constant(true))
    }
}
