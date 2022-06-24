//
//  SuggestionsView.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 22/06/22.
//

import UIKit

protocol SuggestionsViewProtocol: AnyObject {
    func handleBackButton()
    func handleTryAnotherButton()
}

class SuggestionsView: UIView {
    
    var delegate: SuggestionsViewProtocol?
    
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
        lbl.font = UIFont.preferredFont(forTextStyle: .headline)
        
        return lbl
    }()
    
    lazy var suggestionTitle: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.preferredFont(forTextStyle: .title1)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        
        return lbl
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 10.0

        return stack
    }()
    
    //MARK: - Stack 1
    
    lazy var stackItem: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 0.1
        
        return stack
    }()
    
    lazy var numberOfParticipants: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "2"
        lbl.font = .systemFont(ofSize: 30, weight: .bold)
        lbl.textColor = UIColor(red: 0.33, green: 0.00, blue: 0.92, alpha: 1.00)

        return lbl
    }()
    
    lazy var participantsLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Participants"
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .semibold)
        lbl.textColor = UIColor(red: 0.36, green: 0.45, blue: 0.45, alpha: 1.00)

        return lbl
    }()
    
    // MARK: - Stack Price
    
    lazy var stackItemPrice: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 0.1
        
        return stack
    }()
    
    lazy var price: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 22, weight: .bold)
        lbl.textColor = UIColor(red: 0.33, green: 0.00, blue: 0.92, alpha: 1.00)

        return lbl
    }()
    
    lazy var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "$ Price"
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 15, weight: .semibold)
        lbl.textColor = UIColor(red: 0.36, green: 0.45, blue: 0.45, alpha: 1.00)

        return lbl
    }()
    
    // MARK: - Stack Type
    
    lazy var stackItemType: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .equalCentering
        stack.spacing = 10.0
        
        return stack
    }()
    
    lazy var typeLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Relaxation"
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 22, weight: .bold)
        lbl.textColor = UIColor(red: 0.33, green: 0.00, blue: 0.92, alpha: 1.00)

        return lbl
    }()
    
    
    private lazy var tryAnotherButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Try another", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 0.41, green: 0.15, blue: 0.88, alpha: 1.00)
        btn.addTarget(self, action: #selector(self.tappedTryAnother), for: .touchUpInside)
        
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubView() {
        addSubview(barView)
        barView.addSubview(backButton)
        barView.addSubview(titleLabel)
        addSubview(suggestionTitle)
        addSubview(stack)
        stack.addArrangedSubview(stackItem)
        stackItem.addArrangedSubview(numberOfParticipants)
        stackItem.addArrangedSubview(participantsLabel)
        stack.addArrangedSubview(stackItemPrice)
        stackItemPrice.addArrangedSubview(price)
        stackItemPrice.addArrangedSubview(priceLabel)
        stack.addArrangedSubview(stackItemType)
        stackItemType.addArrangedSubview(typeLabel)
    
//        addSubview(numberOfParticipants)
//        addSubview(price)
        addSubview(tryAnotherButton)
    }
    
    @objc private func tappedBackButton() {
        delegate?.handleBackButton()
    }
    
    @objc func tappedTryAnother() {
        delegate?.handleTryAnotherButton()
    }
    
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            barView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            barView.leadingAnchor.constraint(equalTo: leadingAnchor),
            barView.heightAnchor.constraint(equalToConstant: 70),
            barView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            backButton.centerYAnchor.constraint(equalTo: barView.centerYAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleLabel.centerYAnchor.constraint(equalTo: barView.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: barView.centerXAnchor),
            
            suggestionTitle.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 18),
            suggestionTitle.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            suggestionTitle.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            stack.topAnchor.constraint(equalTo: suggestionTitle.bottomAnchor, constant: 45),
            stack.bottomAnchor.constraint(equalTo: tryAnotherButton.topAnchor, constant: -80),
            stack.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            stackItem.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackItem.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackItem.heightAnchor.constraint(equalToConstant: 80),
            
            stackItemPrice.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackItemPrice.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackItemPrice.heightAnchor.constraint(equalToConstant: 80),
            
            stackItemType.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackItemType.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackItemType.heightAnchor.constraint(equalToConstant: 80),
            
            tryAnotherButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            tryAnotherButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            tryAnotherButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -80),
            tryAnotherButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
}
