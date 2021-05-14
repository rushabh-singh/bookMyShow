//
//  HomeViewControllerDelegate.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit
 
extension HomeViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.moviesList?.count ?? 0 > indexPath.row{
            let movieResult : MovieViewModel? = self.moviesList?[indexPath.row]
            if let movie = movieResult {
                showMovieDetailFor(movieId: movie.movieId)
            }
        }
    }
    
    func showMovieDetailFor(movieId : Int){
        DispatchQueue.main.async {
            let movieDetailVC = MovieDetailViewController(movieId: movieId)
            self.navigationController?.pushViewController(movieDetailVC, animated: true)
        }
    }
}
