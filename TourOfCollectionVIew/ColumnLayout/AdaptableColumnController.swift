//
//  ViewController.swift
//  TourOfCollectionVIew
//
//  Created by YJ.Lee on 2022/5/1.
//

import UIKit

class AdaptableColumnController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    var colorArray:[UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemCyan,
        .systemBlue,
        .systemPurple
    ]
    override var description: String {
        return "AdaptableFlowLayout"
    }
    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let layout = ColumnFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        setupCollectionView()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        collectionView.reloadData()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        collectionView.alwaysBounceVertical = true
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "AdaptableColumnCellID")
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colorArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdaptableColumnCellID", for: indexPath)
        cell.contentView.backgroundColor = colorArray[indexPath.item]
        cell.contentView.layer.cornerRadius = 20
        return cell
    }
    

}

