//
//  BMSUtil.swift
//  BookMyShow
//
//  Created by Rushabh Singh on 13/05/21.
//

import Foundation
import UIKit

struct BMSUtil {
    
    func heightForLabel(text: String, font: UIFont, width: CGFloat) -> CGFloat {
       let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
       label.numberOfLines = 0
       label.lineBreakMode = NSLineBreakMode.byWordWrapping
       label.font = font
       label.text = text
       label.sizeToFit()
       return label.frame.height
    }
}
