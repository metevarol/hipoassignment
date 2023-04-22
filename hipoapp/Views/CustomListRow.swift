//
//  CustomListRow.swift
//  hipoapp
//
//  Created by Mete Varol on 21.04.2023.
//

import SwiftUI

struct CustomListRow: View {
    var title: String
    var title2: String
    var title3: Int

    var body: some View {
        HStack {
            HStack{
                
                
                Text(title)
                    .font(.custom("SF UI Display", fixedSize: 15))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack{
                    Text(title2)
                        .font(.custom("SF UI Display", fixedSize: 12))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color(.darkGray))
                    Text(String(title3)+" years in Hipo")
                        .font(.custom("SF UI Display", fixedSize: 12))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .foregroundColor(Color(.darkGray))
                    
                }
                
                
            }
            
        }
        .frame(width: 280, height: 25)
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(10)
        .padding(.horizontal)
       
    }
    
}

struct CustomListRow_Previews: PreviewProvider {
    static var previews: some View {
        CustomListRow(title: "Salih Karasuluoğlu",title2:"Senior iOS Developer",title3: 7)
    }
}
