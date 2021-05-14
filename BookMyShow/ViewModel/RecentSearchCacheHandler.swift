//
//  RecentSearchCacheHandler.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 14/05/21.
//

import Foundation

struct RecentSearchCacheHandler {
    
    let RECENT_SEARCES_MAX_COUNT = 5
    private let RECENT_SEARCH_KEY = "recentSearchKey"
    
    func storeMovieInCache(movie : RecentSearchModel) {
        if movie.movieName.isEmpty || movie.movieId == 0 {
            return
        }
        else{
            self.updateCache(currentMovie: movie)
        }
    }
    
    func getRecentSearchedMovies() -> [RecentSearchModel] {
        var recentSearches = [RecentSearchModel]()
        if let data = UserDefaults.standard.data(forKey: RECENT_SEARCH_KEY) {
            do {
                let decoder = JSONDecoder()
                recentSearches = try decoder.decode([RecentSearchModel].self, from: data)
            } catch {
                print("Unable to Decode (\(error))")
            }
        }
        return recentSearches
    }
    
    private func updateCache(currentMovie : RecentSearchModel){
        var recentSearches = getRecentSearchedMovies()
        if recentSearches.isEmpty{
            recentSearches.insert(currentMovie, at: 0)
        }else{
            for (index,recentSearchedMovie) in recentSearches.enumerated(){
                if currentMovie.movieId == recentSearchedMovie.movieId{
                    recentSearches.remove(at: index)
                }
            }
            recentSearches.insert(currentMovie, at: 0)
            if recentSearches.count > RECENT_SEARCES_MAX_COUNT {
                recentSearches.removeLast()
            }
        }
        storeRecentSearchesArrayInUserDefault(recentSearches :recentSearches)
    }
    
    private func storeRecentSearchesArrayInUserDefault(recentSearches : [RecentSearchModel]){
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(recentSearches)
            UserDefaults.standard.set(data, forKey: RECENT_SEARCH_KEY)
        } catch {
            print("Unable to Encode Array(\(error))")
        }
    }
}
