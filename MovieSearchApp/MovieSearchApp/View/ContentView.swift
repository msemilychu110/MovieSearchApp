//
//  ContentView.swift
//  MovieSearchApp
//
//  Created by Emily-Khine Chu on 7/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var myFruits = MovieListState()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0, content: {
                MovieSearchView()
           
               MovieTableViewList()
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




