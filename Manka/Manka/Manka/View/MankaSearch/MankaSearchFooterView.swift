//
//  MankaSearchFooterView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/23.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

class MankaSearchCollectionViewCell: MankaBaseCollectionViewCell {
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = UIColor.darkGray
        return titleLabel
    }()
    override func setupLayout() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.background.cgColor
        
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)) }
    }
}

typealias MankaSearchTFootDidSelectIndexClosure = (_ index: Int, _ model: MankaSearchItemModel) -> Void

protocol MankaSearchFooterViewDelegate: class {
    func searchFooterView(_ searchTFoot: MankaSearchFooterView, didSelectItemAt index: Int, _ model: MankaSearchItemModel)
}

class MankaSearchFooterView: MankaBaseTableViewHeaderFooterView {
    
    weak var delegate: MankaSearchFooterViewDelegate?
    
    private var didSelectIndexClosure: MankaSearchTFootDidSelectIndexClosure?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UCollectionViewAlignedLayout()
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.horizontalAlignment = .left
        layout.estimatedItemSize = CGSize(width: 100, height: 40)
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: MankaSearchCollectionViewCell.self)
        return collectionView
    }()
    
    var data: [MankaSearchItemModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func setupLayout() {
        contentView.backgroundColor = UIColor.white
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in make.edges.equalToSuperview() }
    }
    
}

extension MankaSearchFooterView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: MankaSearchCollectionViewCell.self)
        cell.layer.cornerRadius = cell.bounds.height * 0.5
        cell.titleLabel.text = data[indexPath.row].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.searchFooterView(self, didSelectItemAt: indexPath.row, data[indexPath.row] )
        
        guard let closure = didSelectIndexClosure else { return }
        closure(indexPath.row, data[indexPath.row])
    }
    
    func didSelectIndexClosure(_ closure: @escaping MankaSearchTFootDidSelectIndexClosure) {
        didSelectIndexClosure = closure
    }
}
