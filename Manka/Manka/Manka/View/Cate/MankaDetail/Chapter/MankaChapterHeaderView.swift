//
//  MankaChapterHeaderView.swift
//  Manka
//
//  Created by CHEN SINYU on 2020/08/22.
//  Copyright © 2020 CHEN SINYU. All rights reserved.
//

import UIKit

typealias MankaChapterCHeadSortClosure = (_ button: UIButton) -> Void

class MankaChapterHeaderView: MankaBaseCollectionReusableView {
    private var sortClosure: MankaChapterCHeadSortClosure?
    
    private lazy var chapterLabel: UILabel = {
        let vl = UILabel()
        vl.textColor = UIColor.gray
        vl.font = UIFont.systemFont(ofSize: 13)
        return vl
    }()
    
    private lazy var sortButton: UIButton = {
        let sn = UIButton(type: .system)
        sn.setTitle("倒序", for: .normal)
        sn.setTitleColor(UIColor.gray, for: .normal)
        sn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        sn.addTarget(self, action: #selector(sortAction(for:)), for: .touchUpInside)
        return sn
    }()
    
    @objc private func sortAction(for button: UIButton) {
        guard let sortClosure = sortClosure else { return }
        sortClosure(button)
    }
    
    func sortClosure(_ closure: @escaping MankaChapterCHeadSortClosure) {
        sortClosure = closure
    }
    
    override func setupLayout() {
        
        addSubview(sortButton)
        sortButton.snp.makeConstraints { make in
            make.right.equalToSuperview()
            make.right.top.bottom.equalToSuperview()
            make.width.equalTo(44)
        }
        
        addSubview(chapterLabel)
        chapterLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.bottom.equalToSuperview()
            make.right.equalTo(sortButton.snp.left).offset(-10)
        }
    }
    
    var model: MankaDetailStaticModel? {
        didSet {
            guard let model = model else { return }
            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd"
            chapterLabel.text = "目录 \(format.string(from: Date(timeIntervalSince1970: model.comic?.last_update_time ?? 0))) 更新 \(model.chapter_list?.last?.name ?? "")"
        }
    }

}
