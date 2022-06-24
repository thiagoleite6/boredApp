//
//  Home.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 17/06/22.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func actionStartButton()
    func actionTermsAndConditionsButton()
}

class HomeView: UIView {
    
    var delegate: HomeScreenProtocol?
    
    // MARK: - Subviews
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Not Bored"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private lazy var inputParticipantsLabel: UILabel = {
        let inputLbl = UILabel()
        inputLbl.translatesAutoresizingMaskIntoConstraints = false
        inputLbl.text = "Participants"
        
        return inputLbl
    }()
    
    private lazy var participantsTextField: UITextField = {
        let participant = UITextField()
        participant.translatesAutoresizingMaskIntoConstraints = false
        participant.borderStyle = .roundedRect
        participant.keyboardType = .numberPad
        participant.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        return participant
    }()
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Start", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.backgroundColor = UIColor(red: 0.41, green: 0.15, blue: 0.88, alpha: 1.00)
        btn.addTarget(self, action: #selector(self.tappedStartButton), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var termsButton: UIButton = {
        let termsBtn = UIButton()
        termsBtn.translatesAutoresizingMaskIntoConstraints = false
        termsBtn.setTitle("Terms and Conditions", for: .normal)
        termsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        termsBtn.setTitleColor(.black, for: .normal)
        termsBtn.addTarget(self, action: #selector(self.tappedTermsAndConditionsButton), for: .touchUpInside)
        
        return termsBtn
    }()
    
    //MARK: - Lifeclycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    
    private func setUpSubViews() {
        addSubview(title)
        addSubview(inputParticipantsLabel)
        addSubview(participantsTextField)
        addSubview(startButton)
        addSubview(termsButton)
    }
    
    
    @objc func textFieldDidChange(textField: UITextField) {
        guard let text = participantsTextField.text else { return }
        if Int(text) != nil && Int(text)! >= 1{
            startButton.isEnabled = true
            startButton.alpha = 1.0
        } else {
            startButton.isEnabled = false
            startButton.alpha = 0.2
        }
       
    }

    @objc func tappedStartButton() {
        self.delegate?.actionStartButton()
    }
    
    @objc func tappedTermsAndConditionsButton() {
        self.delegate?.actionTermsAndConditionsButton()
    }
    
    
    
    
    
    //MARK: - Constraints
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            
            inputParticipantsLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 85),
            inputParticipantsLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            participantsTextField.topAnchor.constraint(equalTo: inputParticipantsLabel.bottomAnchor, constant: 12),
            participantsTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            participantsTextField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            startButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            startButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            startButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            startButton.heightAnchor.constraint(equalToConstant: 45),
            
            termsButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 12),
            termsButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            termsButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
            
        ])
    }
    
}
