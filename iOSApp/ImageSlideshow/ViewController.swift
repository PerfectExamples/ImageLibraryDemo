//
//  ViewController.swift
//  ImageSlideshow
//
//  Created by Petr Zvoníček on 30.07.15.
//  Copyright (c) 2015 Petr Zvonicek. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    open override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    @IBOutlet var slideshow: ImageSlideshow!
	var aSource = [AlamofireSource]()


    override func viewDidLoad() {
        super.viewDidLoad()
		images({
			imgs in
			for s in imgs {
				self.aSource.append(AlamofireSource(urlString:s)!)
			}

			self.slideshow.backgroundColor = UIColor.white
			self.slideshow.slideshowInterval = 5.0
			self.slideshow.pageControlPosition = PageControlPosition.underScrollView
			self.slideshow.pageControl.currentPageIndicatorTintColor = UIColor.lightGray
			self.slideshow.pageControl.pageIndicatorTintColor = UIColor.black
			self.slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
//			self.slideshow.currentPageChanged = { page in
//				print("current page:", page)
//			}

			// try out other sources such as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
			self.slideshow.setImageInputs(self.aSource)

			let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
			self.slideshow.addGestureRecognizer(recognizer)
		})
    }

    func didTap() {
        slideshow.presentFullScreenController(from: self)
    }

	func images(_ callback:@escaping (_ imgs: [String]) -> Void) {
		var xSources = [String]()
		let _ = Alamofire.request("http://localhost:8181/api/v1/images").responseJSON { response in

			switch response.result {
			case .success(let value):
				let json = JSON(value)

				for (_,subJson):(String, JSON) in json["images"] {
					xSources.append("http://localhost:8181\(subJson["path"].string ?? "")/\(subJson["name"].string ?? "")")
				}

				callback(xSources)
			case .failure(let error):
				print(error)
			}
		}
	}
}
