//
//  Home.swift
//  AgendaEscolarUI
//
//  Created by maggie mendez on 27/08/20.
//  Copyright © 2020 maggie mendez. All rights reserved.
//

import SwiftUI

struct Home: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: true){
            //Spacer()
            HomeButtonRow(rowItems: ["logo1", "logo1", "logo1"])
            HomeButtonRow(rowItems: ["logo1"])
            HomeButtonRow(rowItems: ["logo1", "inscripcion", "logo1"])
            HomeButtonRow(rowItems: ["logo1", "logo1", "logo1"])
            HomeButtonRow(rowItems: ["logo1"])
            HomeButtonRow(rowItems: ["logo1"])
        }
    }
}
struct HomeButtonRow: View {
    let row: [String]
    var widthItems: CGFloat = 100
    var padding: CGFloat = 2
    init(rowItems: [String]) {
        row = rowItems
        let items:CGFloat = CGFloat(row.count)
        let spacer: CGFloat = 35 * items
        widthItems = (UIScreen.main.bounds.width - spacer) / items
        padding = 0
    }
    var body: some View{
        HStack(alignment: .center, spacing: 33){
            Spacer()
            ForEach(row, id: \.self){ item in
                Image(item)
                    .resizable()
                    .frame(width: self.widthItems, height: 90)
                    .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 3).shadow(radius: 8).edgesIgnoringSafeArea(.all))
                    .cornerRadius(19)
                    .padding(.all, self.padding)
                    .padding(.top, 4)
                    .foregroundColor(Color.blue)
            }
            Spacer()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
