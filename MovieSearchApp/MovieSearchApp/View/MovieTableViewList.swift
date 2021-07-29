//
//  MovieTableViewList.swift
//  MovieSearchApp
//
//  Created by Emily-Khine Chu on 7/27/21.
//

import SwiftUI
import UIKit

struct MovieTableViewList: View {
    
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject var movieSearchState = MovieSearchState()
    @ObservedObject var imageLoader = ImageLoader()
    @State var nextIndex = 1
    init() {
        popularState.loadMovies(with: .popular)
    }
    var body: some View {
         
         
        if let movies = popularState.movies {
            List(movies.indices, id: \.self) {
            movieIndex in
               let sortedMovies = movies.sorted()
                let movie = sortedMovies[movieIndex]
            MoviePosterCard(movie: movie)
                .onAppear{
                    if movieIndex == (movies.count - 1) {
                        let newNum = (Int(MovieStore.currentPage) ?? 0 ) + 1
                        MovieStore.currentPage = "\(newNum)"
                        popularState.loadMovies(with: .popular)
                }
                
            }
            
            
                        }
        
    }
        
     
    }
    
    
}

        struct MovieTableViewList_Previews: PreviewProvider {
            static var previews: some View {
                MovieTableViewList()
            }
        }


