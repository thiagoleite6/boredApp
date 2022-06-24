//
//  ActivityTableViewCell.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 22/06/22.
//

import UIKit

class ActivityTableViewCell: UITableViewCell {
    
    static let identifier = "cell"
    
    lazy var title: UILabel = {
        var lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubView() {
        addSubview(title)
    }
    
    func setupCell(category: ActivityCategory) {
        title.text = category.name.capitalized
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.centerYAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24)
        ])
    }
    
}

