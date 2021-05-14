//
//  SearchViewControllerDataSource.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 14/05/21.
//

import UIKit
extension SearchViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recentSearchedMovies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let searchCell = searchResultTableView.dequeueReusableCell(withIdentifier: SEARCH_CELL_IDENTIFIER, for: indexPath) as! SearchTableViewCell
        if self.recentSearchedMovies.count > indexPath.row{
            let movie : RecentSearchModel? = self.recentSearchedMovies[indexPath.row]
            if let movie = movie {
                searchCell.movieNameLabel.text = movie.movieName
            }
        }
        return searchCell
    }
    
}
