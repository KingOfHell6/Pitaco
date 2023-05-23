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
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        ForEach(homeVM.pitacos.indices, id: \.self) { index in
                            pitaco(pitaco: homeVM.pitacos[index])
                        }
                    }
                }
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

            BlueButton(action: {
                homeVM.isShowingAdd.toggle()
            }, label: "Adicionar um pitaco")
            .padding(.horizontal, 20)
        }
    }

    @ViewBuilder
    func pitaco(pitaco: Pitaco) -> some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/cJYLon9ejKJV7ua03ab8Tj9u067.jpg")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 107, height: 80)
                .background(.red)

                VStack(alignment: .leading) {
                    Text(pitaco.title)
                    Text(pitaco.genre)
                }
                .frame(maxWidth: .infinity)

                Spacer()
                Spacer()

                Image(systemName: "chevron.right")

                Spacer()
            }
        }
        .background(.gray)
        .cornerRadius(20)
        .padding(.horizontal, 10)
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
