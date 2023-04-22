//
//  AddMemberView.swift
//  hipoapp
//
//  Created by Mete Varol on 22.04.2023.
//

import SwiftUI

struct AddMemberView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: AddMemberViewModel
    var onMemberAdded: (Hipo.Member) -> Void
    
    var body: some View {
        VStack {
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text("Add New Member")
                .font(.headline)
                .foregroundColor(Color("button_red"))
            
            TextField("Name", text: $viewModel.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("GitHub", text: $viewModel.github)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("Position", text: $viewModel.position)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Years in Hipo: \(viewModel.yearsInHipo)", value: $viewModel.yearsInHipo)
                .font(.headline)
                .padding()
            
            Button(action: {
                viewModel.addMember { newMember in
                    onMemberAdded(newMember)
                    dismiss()
                }
            }) {
                Text("Add Member")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .font(.headline)
                    .background(Color("button_red"))
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding()
        }
        .padding()
    }
}

struct AddMemberView_Previews: PreviewProvider {
    static var previews: some View {
        AddMemberView(viewModel: AddMemberViewModel()) { newMember in
            
        }
    }
}

