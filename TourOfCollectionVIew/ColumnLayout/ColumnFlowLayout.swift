//
//  ColumnFlowLayout.swift
//  TourOfCollectionVIew
//
//  Created by YJ.Lee on 2022/5/1.
//

import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        guard let collectionView = collectionView else { return }
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).size.width
        let minColumnWidth = CGFloat(300)
        let maxColumnNums = Int(availableWidth / minColumnWidth)
        let cellWidth = (availableWidth / CGFloat(maxColumnNums)).rounded(.down)
        self.itemSize = .init(width: cellWidth, height: 70.0)
        self.sectionInset = UIEdgeInsets.init(top: minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
}
