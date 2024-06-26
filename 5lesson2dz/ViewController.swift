//
//  ViewController.swift
//  5lesson2dz
//
//  Created by Aiturgan Kurmanbekova on 20/3/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: 280)
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
        
    private let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = .red
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    let model: [Model] = [Model(image: .image1,
                                title: "Welcome to The Note",
                                description: "Welcome to The Note – your new companion for tasks, goals, health – all in one place. Let's get started!"),
                          Model(image: .image2,
                                title: "Set Up Your Profile",
                                description: "Now that you're with us, let's get to know each other better. Fill out your profile, share your interests, and set your goals. "),
                          Model(image: .image3,
                                title: "Dive into The Note",
                                description: "You're fully equipped to dive into the world of The Note. Remember, we're here to assist you every step of the way. Ready to start? Let's go!")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        setupUI()
    }
    
    private func setupUI() {
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
             collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             collectionView.heightAnchor.constraint(equalToConstant: 300)
            ])
        
        view.addSubview(skipButton)
        NSLayoutConstraint.activate(
            [skipButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
             skipButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
             skipButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate(
            [nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
             nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
             nextButton.heightAnchor.constraint(equalToConstant: 40),
             nextButton.widthAnchor.constraint(equalToConstant: 180)
            ])
    }
    
    
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.setData(model: model[indexPath.row])
        
        return cell
    }
    
}
            


