//
//  AddView.swift
//  Pitaco
//
//  Created by Matheus Araújo on 23/05/23.
//

import SwiftUI

struct AddView: View {
    @StateObject var addVM = AddViewModel()
    @Binding var isShowingAddView: Bool

    var body: some View {
        NavigationStack {
            TypeView(addVM: addVM, isShowingAddView: $isShowingAddView)
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(isShowingAddView: .constant(true))
    }
}
