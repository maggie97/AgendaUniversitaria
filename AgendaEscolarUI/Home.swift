//
//  Home.swift
//  AgendaEscolarUI
//
//  Created by maggie mendez on 27/08/20.
//  Copyright © 2020 maggie mendez. All rights reserved.
//

import SwiftUI
import SafariServices

struct Home: View{
    var body: some View{
        ScrollView(.vertical, showsIndicators: true){
            //Spacer()
            HomeButtonRow(rowItems: ["UASLP1", "logo1", "duiPortal"])
            HomeButtonRow(rowItems: ["didactic"])
            HomeButtonRow(rowItems: ["biblio", "iMAT", "horario"])
            HomeButtonRow(rowItems: ["DFM", "creativa", "cajavirtual"])
            HomeButtonRow(rowItems: ["portalAlumnos"])
            HomeButtonRow(rowItems: ["reservacion"])
        }
    }
}
struct HomeButtonRow: View {
    let row: [String]
    var widthItems: CGFloat = 100
    var padding: CGFloat = 2
    @State var show = false
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
                /*Image(item)
                .resizable()
                .frame(width: self.widthItems, height: 90)
                .background(Color.init("blue_uaslp"))
                .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 3).shadow(radius: 8).edgesIgnoringSafeArea(.all))
                .cornerRadius(19)
                .padding(.all, self.padding)
                .padding(.top, 4)*/
                HomeButton(show: self.$show, item: item, width: self.widthItems, padding: self.padding)
                
            }
            Spacer()
        }
    }
}
struct HomeButton:  View{
    @Binding var show: Bool
    let item: String
    let width: CGFloat
    let padding: CGFloat
    
    var body: some View{
        HStack {
            Image(item)
            .resizable()
            .frame(width: self.width, height: 90)
            .background(Color.init("blue_uaslp"))
            .overlay(Rectangle().stroke(Color.primary.opacity(0.3), lineWidth: 3).shadow(radius: 8).edgesIgnoringSafeArea(.all))
            .cornerRadius(19)
            .padding(.all, self.padding)
            .padding(.top, 4)
            .onTapGesture {
                    self.show.toggle()
            }
            .sheet(isPresented: $show) { 
                Safari()
            }
        }
    }
}
struct Safari: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let controller = SFSafariViewController(url: URL(string: "https://infocomp.ingenieria.uaslp.mx/cominf/public/")!)
        return controller
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
enum Url: String {
    case dui = "https://dui.uaslp.mx/portaldui/en/"
    
}
