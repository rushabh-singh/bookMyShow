//
//  SynopsisView.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import UIKit

class SynopsisView: UIView {
    
    @IBOutlet weak var durationValueLabel: UILabel!
    @IBOutlet weak var posterImage: LazyImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieNameLabel: UILabel!
    var contentView : UIView!
    
    var synopsisViewModel : SynopsisViewModel!{
        didSet{
            durationValueLabel.text = synopsisViewModel.duration
            movieNameLabel.text = synopsisViewModel.movieName
            overviewLabel.text = synopsisViewModel.overview
            releaseDateLabel.text = synopsisViewModel.releaseDate
            posterImage.loadImage(fromURL: synopsisViewModel.posterUrl, placeHolderImage: ImagesNameConstant.placeholder)
            overviewLabel.frame.size.height = BMSUtil().heightForLabel(text: overviewLabel.text!, font: overviewLabel.font, width: overviewLabel.frame.size.width)
            overviewLabel.sizeToFit()
        }
    }
    
    func getHeightOfView() -> CGFloat {
        //variable heights + constant heights
        return posterImage.frame.height + movieNameLabel.frame.size.height + overviewLabel.frame.size.height + 100
    } 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    func setUpView() {
        contentView = loadViewFromNib()
        contentView.frame = bounds
        addSubview(contentView)
    }
     
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
}
