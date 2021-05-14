//
//  MovieDetailViewController.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var scrollableContentView: UIView!
    @IBOutlet weak var scrollableContentHeightConstraint: NSLayoutConstraint!
    var movieId : Int?
    var movieName : String?
    let synopsisView = SynopsisView()
    
    init(movieId : Int) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchSynopsisData()
        synopsisView.frame = CGRect(x: HORIZONTAL_PADDING, y: VERTICAL_PADDING, width: UIScreen.main.bounds.width - 2*HORIZONTAL_PADDING, height: DEFAULT_HEIGHT)
        scrollableContentView.addSubview(synopsisView)
    }
    
    private func fetchSynopsisData(){
        let urlString = APIConstants.BaseUrl + "\(self.movieId ?? 0)?api_key=" + APIConstants.API_KEY
        HttpUtil.shared.getData(urlString: urlString, responseType: SynopsisModel.self) { (response) in
            DispatchQueue.main.async {
                self.movieName = response?.title
                self.synopsisView.synopsisViewModel = SynopsisViewModel(data: response)
                self.synopsisView.frame.size.height = self.synopsisView.getHeightOfView()
                self.scrollableContentHeightConstraint.constant = self.synopsisView.getHeightOfView() + VERTICAL_PADDING
                self.setMovieDataInCache()
            }
        }
    }
    
    func setMovieDataInCache(){
        let movie = RecentSearchModel(movieId: self.movieId ?? 0, movieName: self.movieName ?? "")
        RecentSearchCacheHandler().storeMovieInCache(movie: movie)
    }
}
