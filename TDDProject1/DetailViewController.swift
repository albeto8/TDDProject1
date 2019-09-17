//
//  DetailViewController.swift
//  TDDProject1
//
//  Created by Mario Alberto Barragán Espinosa on 9/16/19.
//  Copyright © 2019 Mario Alberto Barragán Espinosa. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    let imageView = UIImageView()
    var selectedImage: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func loadView() {
        imageView.backgroundColor = .white
        imageView.contentMode = .scaleAspectFit
        view = imageView
    }

}
