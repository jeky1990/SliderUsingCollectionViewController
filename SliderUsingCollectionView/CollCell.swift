//
//  CollCell.swift
//  SliderUsingCollectionView
//
//  Created by macbook on 10/26/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

class CollCell: UICollectionViewCell {
    
    let CellView : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let CellView2 : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    let Firstlabel : UILabel = {
        
        let label = UILabel()
        label.text = "jkdfhskjdhfsdhjf kjdfakjsflkjasf ladjksfasjdf alkjfsajdf alkjsfa ajkhsfkjas fajsaljkfjk fjalkjslkjf alkjsdkjasf alkjdfa "
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 0
        return label
        
    }()
    
    let Secondlabel : UILabel = {
        
        let label = UILabel()
        label.text = "jkdfhskjdhfsdhjf kjdfakjsflkjasf ladjksfasjdf alkjfsajdf alkjsfa"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 0
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        CreateView()
        GiveConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    func CreateView()
    {
        self.addSubview(CellView)
        self.addSubview(CellView2)
        
        NSLayoutConstraint.activate([
            
            CellView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            CellView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            CellView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            CellView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.5),
            
            CellView2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            CellView2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            CellView2.topAnchor.constraint(equalTo: self.CellView.safeAreaLayoutGuide.bottomAnchor),
            CellView2.heightAnchor.constraint(equalTo: self.CellView.heightAnchor)
            
            ])
    }
    
    func GiveConstraint()
    {
       
        self.addSubview(Firstlabel)
        self.addSubview(Secondlabel)
        
        NSLayoutConstraint.activate([
            
            Firstlabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant:20),
            Firstlabel.centerXAnchor.constraint(equalTo: self.CellView.centerXAnchor),
            Firstlabel.centerYAnchor.constraint(equalTo: self.CellView.centerYAnchor),
            Firstlabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
            Secondlabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant:20),
            Secondlabel.centerXAnchor.constraint(equalTo: self.CellView2.centerXAnchor),
            Secondlabel.centerYAnchor.constraint(equalTo: self.CellView2.centerYAnchor),
            Secondlabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            
         
            
            ])
    }

    
}
