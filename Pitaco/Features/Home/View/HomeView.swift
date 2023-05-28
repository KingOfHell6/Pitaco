//
//  HomeView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 04/05/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject private var homeVM = HomeViewModel()

    var body: some View {
        VStack {
            ScrollView {
                ForEach(homeVM.pitacos.indices, id: \.self) { index in
                    NavigationLink {
                        Text("Putinha barata")
                    } label: {
                        CellView(pitaco: homeVM.pitacos[index])
                            .padding(.horizontal, 20)
                    }

                }
            }

            BlueButton(action: {
                homeVM.isShowingAdd.toggle()
            }, label: "Adicionar um pitaco")
            .padding(.horizontal, 20)
        }
        .onAppear {
            homeVM.getPitacos()
        }
        .refreshable {
            homeVM.getPitacos()
        }
        .sheet(isPresented: $homeVM.isShowingAdd) {
            AddView(isShowingAddView: $homeVM.isShowingAdd)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
