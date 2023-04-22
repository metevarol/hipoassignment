//
//  ContentView.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import SwiftUI

struct ContentView: View {
   
    
    var body: some View {
        MembersView(members: [
            Hipo.Member(name: "Salih Karasuluoğlu", github: "sakkaras", hipo: Hipo.HipoInfo(position: "Team Lead", years_in_hipo: 7)),
            
            Hipo.Member(name: "Ömer Emre Aslan", github: "OEA", hipo: Hipo.HipoInfo(position: "Senior iOS Developer", years_in_hipo: 6)),
            
            Hipo.Member(name: "Göktuğ Berk Ulu", github: "goktugberkulu", hipo: Hipo.HipoInfo(position: "Senior iOS Developer", years_in_hipo: 6)),
            
            Hipo.Member(name: "Ahmet Cemal Şahin", github: "acsahin", hipo: Hipo.HipoInfo(position: "Junior iOS Developer", years_in_hipo: 2)),
            
            Hipo.Member(name: "Ege Eke", github: "ekeege", hipo: Hipo.HipoInfo(position: "iOS Developer", years_in_hipo: 2))
            
        
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

