//
//  SearchBarView.swift
//  FirstStep
//
//  Created by Jakub Stolarczyk on 19/11/2021.
//

import SwiftUI
import os.log

struct SearchBar: View {
    @Binding var searchPhrase: String
    
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField(
                "Search ...",
                text: $searchPhrase
            ).onChange(of: searchPhrase) {
                print($searchPhrase)
            }
            .padding(7)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(
                            minWidth: 0,
                            maxWidth: .infinity,
                            alignment: .leading
                        )
                        .padding(.leading, 8)
                    
                    if isEditing {
                        Button(action: {
                            self.searchPhrase = ""
                            
                        }) {
                            Image(
                                systemName:"multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 10)
            .onTapGesture {
                self.isEditing = true
            }
            
            if isEditing {
                Button(action: {
                    self.isEditing =  false
                    self.searchPhrase = ""
                    
                    // Dismiss the keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("Cancel")
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
    
    func performSearch() {
        os_log("Simple log message.")
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchPhrase: .constant(""))
    }
}
