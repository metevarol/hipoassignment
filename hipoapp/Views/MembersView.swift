//
//  MembersView.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import SwiftUI

struct MembersView: View {
    @StateObject private var viewModel: MembersViewModel
    @State private var showAddMemberSheet: Bool = false
    
    init(members: [Hipo.Member]) {
        _viewModel = StateObject(wrappedValue: MembersViewModel(members: members))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Image("logo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                
                Text("Members")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color("button_red"))
                
                
                SearchBar(text: $viewModel.searchText)
                    .padding(.horizontal)
                
                
                List {
                    ForEach(viewModel.filteredMembers) { member in
                        NavigationLink(destination: MemberDetailView(member: member)) {
                            CustomListRow(title: member.name,title2: member.hipo.position,title3: member.hipo.years_in_hipo)
                            
                        }
                        .listRowBackground(Color.clear)
                        
                    }
                    .onDelete(perform: viewModel.deleteMember)
                    
                }
                .listStyle(PlainListStyle())
                
                
                Button(action: { viewModel.sortMembers() })
                {
                    Text("SORT MEMBERS")
                        .font(.subheadline
                        )
                        .fontWeight(.bold)
                        .frame(width: 310, height: 25)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(40)
                        .padding(.horizontal)
                    
                    
                }
                
                
                Button(action: { showAddMemberSheet.toggle() }) {
                    Text("ADD NEW MEMBER")
                        .font(.subheadline
                        )
                        .fontWeight(.bold)
                        .frame(width: 310, height: 25)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("button_red"))
                        .cornerRadius(40)
                        .padding(.horizontal)
                }
                .sheet(isPresented: $showAddMemberSheet) {
                    AddMemberView(viewModel: AddMemberViewModel()) { newMember in
                        viewModel.addMember(newMember)
                    }
                }
                Spacer()
                Spacer()
            }
            //                    .navigationTitle("Members")
            //                   .navigationBarTitleDisplayMode(.inline)
            
        }
        .tint(.black)
        
    }
    
}



struct MembersView_Previews: PreviewProvider {
    static var previews: some View {
        MembersView(members: [
            Hipo.Member(name: "Göktuğ Berk Ulu", github: "goktugberkulu", hipo: Hipo.HipoInfo(position: "Senior iOS Developer", years_in_hipo: 6)),
            Hipo.Member(name: "Ömer Emre Aslan", github: "OEA", hipo: Hipo.HipoInfo(position: "Senior iOS Developer", years_in_hipo: 6))
            
        ])
    }
}

