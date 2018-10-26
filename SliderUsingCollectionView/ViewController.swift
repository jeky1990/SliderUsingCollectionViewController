//
//  ViewController.swift
//  SliderUsingCollectionView
//
//  Created by macbook on 10/26/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    

    let CollView =  UICollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        CreateCollectionView()
    }
    
    func CreateCollectionView()
    {
        
        CollView.register(CollCell.self, forCellWithReuseIdentifier: "cell")
        CollView.delegate = self
        CollView.dataSource = self
        self.view.addSubview(CollView)
        
        NSLayoutConstraint.activate([

            CollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            CollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            CollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            CollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)

            ])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
}




