//
//  ContentView.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 08/11/21.
//

import SwiftUI

struct ContentView: View {
    @State var name = "Hello"
    
    var body: some View {
        VStack(spacing: 10){
            LottieView(name: "cta_load_dark", loopMode: .loop)
            Button(name){
                print("hello")
            }
            .buttonStyle(PlunkButton(buttonModel: NeopopHelper.primary50_plunk_button_model(style: .dark)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
