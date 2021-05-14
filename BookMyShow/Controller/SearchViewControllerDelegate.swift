//
//  SearchViewControllerDelegate.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 14/05/21.
//

import UIKit

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.recentSearchedMovies.count > indexPath.row{
            let movie : RecentSearchModel? = self.recentSearchedMovies[indexPath.row]
            if let movie = movie {
                self.delegate?.openMovieDetailFor(movieId: movie.movieId)
                self.dismiss(animated: true, completion: nil)
            }
        }
        
    }
}
