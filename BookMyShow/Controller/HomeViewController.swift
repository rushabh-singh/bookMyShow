//
//  ViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 12/05/21.
//

import UIKit

class HomeViewController: UIViewController, SearchCellProtocol {
    
    var moviesList : [MovieViewModel]?
    let POPULAR_MOVIE_CELL_IDENTIFIER = "PopularMovieCellIdentifier"
    let POPULAR_MOVIE_CELL = "PopularMovieCell"
    let NAVIGATION_TITLE = "Popular Movies"
    @IBOutlet weak var popularMoviesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = NAVIGATION_TITLE
        setupTableView()
        downloadMoviesList()
    }
    
    private func setupTableView() {
        popularMoviesTableView.delegate = self
        popularMoviesTableView.dataSource = self
        let popularMovieNib = UINib(nibName: POPULAR_MOVIE_CELL, bundle: nil)
        popularMoviesTableView.register(popularMovieNib, forCellReuseIdentifier: POPULAR_MOVIE_CELL_IDENTIFIER)
    }
    
    private func downloadMoviesList(){
        let urlString = APIConstants.PopularMoviesListUrl
        HttpUtil.shared.getData(urlString: urlString, responseType: PopularMoviesModel.self) { (response) in
            if response?.results.count ?? 0 > 0 {
                DispatchQueue.main.async {
                    //Covert data model to viewModel for all business logic and validations
                    self.moviesList = response?.results.map({
                        return MovieViewModel(movie : $0)
                    })
                    self.popularMoviesTableView.reloadData()
                }
            }else{
                DispatchQueue.main.async {
                    self.popularMoviesTableView.isHidden = true
                }
            }
        }
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        let searchVC = SearchViewController()
        searchVC.delegate = self
        self.navigationController?.present(searchVC, animated: true, completion: nil)
    }
    
    //Protocol method
    func openMovieDetailFor(movieId: Int) {
        self.showMovieDetailFor(movieId: movieId)
    }
}

