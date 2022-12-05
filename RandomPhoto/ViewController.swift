//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Kevin Hernandez on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    let colors: [UIColor] = [
        .systemPink,
        .systemRed,
        .systemBlue,
        .systemGreen,
        .systemCyan,
        .systemGray,
        .systemMint,
        .systemTeal,
        .systemBrown,
        .systemIndigo,
        .systemOrange,
        .systemPurple,
        .white
    ]
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("New Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/300x300"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else {
            return
        }
        imageView.image = UIImage (data: data)
    }
    
    @objc func didTapButton(){
        getRandomPhoto()
        view.backgroundColor = colors.randomElement()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        imageView.center = view.center
        getRandomPhoto()
        view.addSubview(button)
        button.frame = CGRect(x: view.center.x-150,
                              y: view.center.y+270,
                              width: 300,
                              height: 50)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

    }
    
}

