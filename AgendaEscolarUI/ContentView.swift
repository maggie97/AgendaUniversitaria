//
//  ContentView.swift
//  AgendaEscolarUI
//
//  Created by maggie mendez on 15/06/20.
//  Copyright © 2020 maggie mendez. All rights reserved.
//

import SwiftUI

struct ContentView: View{
    var body : some View{
        Container()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Container: View {
    @State var currentNameView = MenuName.home
    
    @State var show = false
    var drag: some Gesture{
        DragGesture()
            .onEnded { gesture in
                if gesture.translation.width > -UIScreen.main.bounds.width / 1.3{
                    withAnimation {
                        self.show.toggle()
                    }
                }
            }
    }

    
    var body: some View{
        ZStack {
            NavigationContainer(show: $show)
            GeometryReader{_  in
                HStack {
                    Menu(show: self.$show)
                        .offset(x: self.show ? 0 : -UIScreen.main.bounds.width / 1.3 )
                        .gesture(self.drag)
                    
                    Spacer(minLength: 0)
                    
                }
                .background(Color.primary.opacity(self.show ?  0.3 : 0).edgesIgnoringSafeArea(.all))
                .edgesIgnoringSafeArea(.all)
            }
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded{ gesture in
                        print(gesture.location.x)
                        if gesture.location.x > UIScreen.main.bounds.width / 1.1{ // creo que con 1.1 funciona mejor
                            withAnimation{
                                self.show.toggle()
                            }
                        }
                        
                }
            )
        }
    }
}

struct NavigationContainer: View {
    var title: String = "Home"
    @Binding var show: Bool
    var body: some View{
        NavigationView{
            GeometryReader(){_ in
                ZStack(alignment: .center){
                        Color.black.opacity(0.05).edgesIgnoringSafeArea(.all)
                        //Home()
                    self.choose(a: .home)
                        .background(Color.white.edgesIgnoringSafeArea(.all))
                }
            }
            .navigationBarTitle(Text(title), displayMode: .inline)
            .navigationBarItems(leading:
                NavigationItemButton(icon: "line.horizontal.3.decrease", action: {
                    withAnimation(.default){
                        print( "opening" )
                        self.show.toggle()
                    }
                }),
                trailing:
                NavigationItemButton(icon: "ellipsis.circle", action: {
                    print( "oprions" )
                })
            )
           
        }
    }
    func choose(a view: MenuName ) -> some View{
        switch view {
        case .home:
            return Home()
        default:
            return Home()
        }
    }
}

struct NavigationItemButton: View {
    let icon: String
    let action: () -> ()

    var body: some View{
        Button(action: action) {
            Image(systemName: icon)
            .resizable()
            .frame(width: 20, height: 15)
            .foregroundColor(.black)
        }
    }
}
