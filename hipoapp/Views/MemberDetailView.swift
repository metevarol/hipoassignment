//
//  MemberDetailView.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import SwiftUI
import SafariServices

struct MemberDetailView: View {
    @ObservedObject var viewModel: MemberDetailViewModel
    
    init(member: Hipo.Member) {
        viewModel = MemberDetailViewModel(member: member)
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    HStack{
                        Spacer()
                        if let name = viewModel.gitHubUser?.login{
                            Text(name)
                                .font(.custom("SF UI Display",
                                              fixedSize: 25)
                                )
                        }
                        Spacer()
                    }
                    
                    VStack{
                        VStack{
                            HStack{
                                Spacer()
                                if let imageUrl = viewModel.gitHubUser?.avatar_url {
                                    AsyncImage(url: URL(string: imageUrl)) { phase in
                                        switch phase {
                                        case .success(let image):
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .padding()
                                        case .failure:
                                            ProgressView()
                                        default:
                                            ProgressView()
                                        }
                                    }
                                }
                                Spacer()
                            }
                            
                            
                            HStack {
                                Spacer()
                                VStack(alignment: .center, spacing: 10) {
                                    Text("Followers")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    
                                    Text("\(viewModel.gitHubUser?.followers ?? 0)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                    
                                }
                                .padding(.leading)
                                
                                Spacer()
                                
                                VStack(alignment: .center, spacing: 10) {
                                    Text("Following")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("\(viewModel.gitHubUser?.following ?? 0)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                }
                                .padding(.trailing)
                                
                                Spacer()
                                
                            }
                            Spacer()
                            Spacer()
                        }
                        .background(Color("darkgray"))
                        
                        
                        
                        
                        HStack{
                            Spacer()
                            
                            VStack{
                                Spacer()
                                Spacer()
                                Text("Repositories")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom)
                                
                            }
                            
                            Spacer()
                        }
                        .background(Color("button_red"))
                        
                    }
                    
                    
                    ForEach(viewModel.repositories) { repository in
                        Link(destination: URL(string: repository.html_url)!, label: {
                        HStack {
                            
                            VStack(alignment:.leading){
                                Text(repository.name)
                                    .font(.custom("SF UI Display",
                                                  fixedSize: 14)
                                    )
                                Text("\(repository.language ?? "N/A")")
                                    .font(.custom("SF UI Display",
                                                  fixedSize: 14)
                                    )
                                    .foregroundColor(Color.green)
                                
                            }
                            Spacer()
                            VStack(alignment:.trailing){
                                Text("\(formatDate(repository.updated_at))")
                                    .font(.custom("SF UI Display",
                                                  fixedSize: 14)
                                    )
                                
                                HStack{
                                    Text(Image(systemName: "star.fill"))
                                        .font(.caption)
                                        .foregroundColor(.yellow)
                                    
                                    Text("\(repository.stargazers_count)")
                                        .font(.custom("SF UI Display",
                                                      fixedSize: 14)
                                        )
                                }
                            }
                        }
                        .frame(width: 330, height: 25)
                        .padding()
                        .background(Color(.systemGray5))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        
                    })
                    }
                }
            }
            
            VStack {
                Spacer()
                Button(action: { viewModel.sortByDate() }) {
                    Text("SORT BY DATE")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .frame(width: 310, height: 25)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color("button_red"))
                        .cornerRadius(40)
                        .padding(.horizontal)
                }
//                .padding(.bottom)
            }
        }
    }
}


func formatDate(_ dateString: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    
    guard let date = dateFormatter.date(from: dateString) else {
        return "Invalid Date"
    }
    
    dateFormatter.dateFormat = "MMMM dd, yyyy"
    
    return dateFormatter.string(from: date)
}

struct MemberDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemberDetailView(member: Hipo.Member(name: "Ömer Emre Aslan", github: "OEA", hipo: Hipo.HipoInfo(position: "Senior iOS Developer", years_in_hipo: 6)))
    }
}

