//
//  Menu.swift
//  AgendaEscolarUI
//
//  Created by maggie mendez on 27/08/20.
//  Copyright © 2020 maggie mendez. All rights reserved.
//

import SwiftUI

struct Menu: View {
    @Binding var show: Bool
    
    let width: CGFloat = UIScreen.main.bounds.width / 1.3
    let height: CGFloat = 170
    var body: some View{
        
        VStack(alignment: .leading) {
            ZStack {
                Rectangle()
                    .frame(width: width, height: height)
                    .background(Color.blue)
                Image("background_UASLP")
                    .resizable()
                    .frame(width: width, height: height)
                    .opacity(0.8)
                
                Image( "logoUASLP")
                    .resizable()
                    .frame(width: -(width / 4), height: (height/2), alignment: .topTrailing)
                    .clipShape(Circle())
                    .offset(x: -90, y: -20)
                    
                Text("UniAgenda")
                    .foregroundColor(Color.white)
                    .offset(x: -60,y:50)
                    .font(Font.title)
            }
            //Spacer()
        
            VStack(alignment: .leading) {
                ItemMenu(icon: "pencil", nameItem: "Inicio"){}
                ItemMenu(icon: "pencil", nameItem: "Agenda Escolar"){}
                ItemMenu(icon: "pencil", nameItem: "Calendario UASLP "){}
                ItemMenu(icon: "pencil", nameItem: "Calendario Facultad"){}
                ItemMenu(icon: "pencil", nameItem: "Mis notas"){}
                ItemMenu(icon: "pencil", nameItem: "Herramientas"){}
                    .padding(.bottom, 10)
                Rectangle().frame(width: width - 50, height: 0.5)
                    .padding(.bottom, 10)
                    .padding(.top, 20)
                Text("Contacto")
                    .foregroundColor(Color.gray)
                ItemMenu(icon: "pencil", nameItem: "Creditos"){}
            }
            .padding(.horizontal, 22)
            Spacer()
            
        }
        .background(Color.white)
        .overlay(Rectangle().stroke(Color.primary.opacity(0.2), lineWidth: 2).shadow(radius: 3).edgesIgnoringSafeArea(.all))
        
    }
}
struct ItemMenu: View {
    
    let icon: String
    let nameItem: String
    let action: (() -> Void)?
    
    var body: some View{
        
        HStack(spacing: 22) {
            Button(action: action ?? { print( "fail" ) }) {
                Image(systemName: icon)
                .resizable()
                .frame(width: 20, height: 15)
                .foregroundColor(.black)
                
                Text(nameItem)
                    .foregroundColor(Color.black)
            }
            
        }.padding(.top, 10)
    }
}
