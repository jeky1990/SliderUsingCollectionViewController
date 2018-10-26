//
//  SwipingController.swift
//  SliderUsingCollectionView
//
//  Created by macbook on 10/26/18.
//  Copyright © 2018 macbook. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SwipingController: UICollectionViewController,UICollectionViewDelegateFlowLayout{
    
    
    let firstLableArr = [1,2,3,4,5,6]
    let SecLabelArr = [2,3,4,5,6,7]
    
    let PrevButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("PREV", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.addTarget(self, action: #selector(PrevSlide), for: .touchUpInside)
        return button
        
    }()
    
    @objc func PrevSlide(sender:UIButton)
    {
        let prevIndex = PageControl.currentPage - 1
        let index = IndexPath(item: prevIndex, section: 0)
        PageControl.currentPage = prevIndex
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    let NextButton : UIButton = {
        
        let button = UIButton()
        button.setTitle("NEXT", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        button.addTarget(self, action: #selector(NextSlide), for: .touchUpInside)
        return button
        
    }()
    
    @objc func NextSlide(sender:UIButton)
    {
        let NextIndex = min(PageControl.currentPage + 1,firstLableArr.count-1)
        let index = IndexPath(item: NextIndex, section: 0)
        PageControl.currentPage = NextIndex
        collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
    }
    
    let PageControl : UIPageControl = {
        
        let pagecontrol = UIPageControl()
        pagecontrol.currentPage = 0
        pagecontrol.currentPageIndicatorTintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        pagecontrol.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        pagecontrol.translatesAutoresizingMaskIntoConstraints = false
        pagecontrol.pageIndicatorTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return pagecontrol
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        PageControl.numberOfPages = firstLableArr.count
        SetUpStackView()
        self.collectionView!.register(CollCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.isPagingEnabled = true
        
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return firstLableArr.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollCell
        
        cell.Firstlabel.text = String(firstLableArr[indexPath.row])
        cell.Secondlabel.text = String(SecLabelArr[indexPath.row])

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: self.view.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func SetUpStackView()
    {
        let stackview = UIStackView(arrangedSubviews: [PrevButton,PageControl,NextButton])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        
        self.view.addSubview(stackview)
    
        
        NSLayoutConstraint.activate([
            
            stackview.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            stackview.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            stackview.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            stackview.heightAnchor.constraint(equalToConstant: 50),
            
            ])
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        PageControl.currentPage = Int(x/view.frame.width)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.PageControl.currentPage == 0
            {
                self.collectionView.contentOffset = .zero
            }else
            {
                let indexpath = IndexPath(item: self.PageControl.currentPage, section: 0)
                self.collectionView.scrollToItem(at: indexpath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
        }
    }
    
    
}
