//
//  HomeViewControllerDataSource.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit
 
extension HomeViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let popularMovieCell = popularMoviesTableView.dequeueReusableCell(withIdentifier: POPULAR_MOVIE_CELL_IDENTIFIER, for: indexPath) as! PopularMovieCell
        return popularMovieCell
        
    }
    
}
