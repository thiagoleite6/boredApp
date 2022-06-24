//
//  Activities.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 20/06/22.
//

import UIKit

protocol ActivitiesViewProtocol {
    func handleBackButton()
    func handleRandomButton()
}

class ActivitiesView: UIView {
    
    var delegate: ActivitiesViewProtocol?
    //MARK: - Subviews
    
    lazy var barView: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        
        return vw
    }()
    
    lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "back"), for: .normal)
        btn.addTarget(self, action: #selector(self.tappedBackButton), for: .touchUpInside)
        
        return btn
    }()
    
    lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Activities"
        lbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return lbl
    }()
    
    lazy var randomButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "shuffle"), for: .normal)
        btn.addTarget(self, action: #selector(self.tappedRandomButton), for: .touchUpInside)
        
        return btn
    }()
    
    
    private lazy var tableView: UITableView = {
        let tbl = UITableView()
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.register(ActivityTableViewCell.self, forCellReuseIdentifier: ActivityTableViewCell.identifier)
        
        return tbl
    }()
    
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
        setupConstraints()
        
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupSubViews() {
        addSubview(barView)
        barView.addSubview(backButton)
        barView.addSubview(titleLabel)
        barView.addSubview(randomButton)
        
        addSubview(tableView)
    }
    
    func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    @objc private func tappedBackButton() {
        delegate?.handleBackButton()
    }
    
    @objc private func tappedRandomButton() {
        delegate?.handleRandomButton()
    }
    
    //MARK: - Contraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            barView.leadingAnchor.constraint(equalTo: leadingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 70),
            barView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: barView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: barView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: barView.centerXAnchor),
            
            randomButton.centerYAnchor.constraint(equalTo: barView.centerYAnchor),
            randomButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            randomButton.widthAnchor.constraint(equalToConstant: 25),
            randomButton.heightAnchor.constraint(equalToConstant: 25),
            
            tableView.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 18),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            
        ])
    }

}

