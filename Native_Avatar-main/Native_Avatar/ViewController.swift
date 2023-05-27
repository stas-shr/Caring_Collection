//
//  ViewController.swift
//  Native_Avatar
//
//  Created by Стас on 24.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let imageSize: CGFloat = 36
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .systemBackground
        return scrollView
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImage(systemName: "person.crop.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .gray
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Avatar"
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.contentSize = .init(width: view.frame.width, height: 2000)
        scrollView.delegate = self
        navigationController?.navigationBar.prefersLargeTitles = true
        view = scrollView
        imageView.contentMode = .scaleAspectFill
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let subviews = navigationController?.navigationBar.subviews else {
            return
        }
        
        for subview in subviews {
            if let label = subview.subviews.first(where: { $0 is UILabel }) {
                subview.addSubview(imageView)
                
                NSLayoutConstraint.activate([
                    imageView.heightAnchor.constraint(equalToConstant: imageSize),
                    imageView.widthAnchor.constraint(equalToConstant: imageSize),
                    imageView.trailingAnchor.constraint(equalTo: subview.trailingAnchor, constant: -16),
                    imageView.centerYAnchor.constraint(equalTo: label.centerYAnchor)
                ])
            }
        }
    }
}
