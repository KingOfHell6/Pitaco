//
//  CellView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 24/05/23.
//

import SwiftUI

struct CellView: View {
    var pitaco: Pitaco?

    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: "https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/cJYLon9ejKJV7ua03ab8Tj9u067.jpg")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 107, height: 80)

                VStack(alignment: .leading) {
                    Text(pitaco?.title ?? "")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)

                    Text(pitaco?.genre ?? "")
                        .font(.system(size: 11, weight: .bold))
                        .foregroundColor(Color("GenreLabel"))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)

                Spacer()

                Image(systemName: "chevron.right")
                    .foregroundColor(.blue)
                    .padding(.trailing, 22)

            }
        }
        .frame(maxWidth: .infinity, idealHeight: 80)
        .background(Color("Cell"))
        .cornerRadius(15)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView()
    }
}
