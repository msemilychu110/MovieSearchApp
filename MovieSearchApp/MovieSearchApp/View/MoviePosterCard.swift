//
//  MoviePosterCard.swift
//  MovieSearchApp
//
//  Created by Emily-Khine Chu on 7/27/21.
//

import SwiftUI

struct MoviePosterCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    @State private var selection: String? = nil

    var body: some View {
        ZStack {
            if self.imageLoader.image != nil {
//                Text(movie.title)
                    VStack{
                        NavigationLink(destination: MovieDetailView(movieId: movie.id), tag: "A", selection: $selection) { }
                            Image(uiImage: self.imageLoader.image!)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(8)
                                .shadow(radius: 4)
                                .clipped()
                                .onTapGesture {
                                    selection = "A"
                                }
                
                    }
                    
            }
             else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(width: 204, height: 306)
        .onAppear {
            if let posterUrL = self.movie.posterURL{
                self.imageLoader.loadImage(with: posterUrL)
            }
        }
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCard(movie: Movie(id: 0, title: "", backdropPath: "", posterPath: "", overview: "", voteAverage: 0.0, voteCount: 0, runtime: 0, releaseDate: "", genres: [MovieGenre(name: "")], credits: MovieCredit(cast: [MovieCast(id: 0, character: "", name: "")], crew: [MovieCrew(id: 0, job: "", name:"")]), videos: MovieVideoResponse(results: [MovieVideo(id: "", key: "", name: "", site: "")])))
        
}
}
