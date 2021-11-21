//
//  ContentView.swift
//  Shared
//
//  Created by Jakub Stolarczyk on 18/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    
    var body: some View {
        VStack{
            Text("Enter your country below").padding(.bottom,60)
            SearchBar(searchPhrase: $searchText).padding(30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}

