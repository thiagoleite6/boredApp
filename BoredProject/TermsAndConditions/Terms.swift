//
//  Terms.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 21/06/22.
//

import UIKit

protocol TermsProtocol: AnyObject {
    func tappedCloseButton()
}

class Terms: UIView {
    //MARK: - Props
    
    var delegate: TermsProtocol?
    
    var text = """
        Mussum Ipsum, cacilds vidis litro abertis. Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.Viva Forevis aptent taciti sociosqu ad litora torquent.Diuretics paradis num copo é motivis de denguis.Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl.
    
    Casamentiss faiz malandris se pirulitá.A ordem dos tratores não altera o pão duris.Si num tem leite então bota uma pinga aí cumpadi!Não sou faixa preta cumpadi, sou preto inteiris, inteiris.
    
    Paisis, filhis, espiritis santis.In elementis mé pra quem é amistosis quis leo.Tá deprimidis, eu conheço uma cachacis que pode alegrar sua vidis.Nec orci ornare consequat. Praesent lacinia ultrices consectetur. Sed non ipsum felis.
    
    Interagi no mé, cursus quis, vehicula ac nisi.Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.Paisis, filhis, espiritis santis.Quem num gosta di mé, boa gentis num é.
    
    Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.Si num tem leite então bota uma pinga aí cumpadi!Copo furadis é disculpa de bebadis, arcu quam euismod magna.Per aumento de cachacis, eu reclamis.
    
    Quem num gosta di mé, boa gentis num é.Mauris nec dolor in eros commodo tempor. Aenean aliquam molestie leo, vitae iaculis nisl.Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.Pra lá , depois divoltis porris, paradis.
"""
    //MARK: - Components
    
    private lazy var closeButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(systemName: "multiply.circle"), for: .normal)
        btn.tintColor = .black
        btn.addTarget(self, action: #selector(self.tappedCloseButton), for: .touchUpInside)
        
        return btn
    }()
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Termos & Condições"
        lbl.textAlignment = .center
        lbl.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return lbl
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        return scroll
    }()
    
    private lazy var view: UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
                
        return vw
    }()
    
    private lazy var termsText: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = text
        lbl.numberOfLines = 0
        lbl.textAlignment = .left
        
        return lbl
    }()
    
    //MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    @objc func tappedCloseButton() {
        self.delegate?.tappedCloseButton()
    }
    
    private func setupSubView() {
        addSubview(closeButton)
        addSubview(titleLabel)
        addSubview(scrollView)
        scrollView.addSubview(view)
        view.addSubview(termsText)
    }
    
    //MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            titleLabel.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            titleLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            view.topAnchor.constraint(equalTo: scrollView.topAnchor),
            view.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            view.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            view.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            
            termsText.topAnchor.constraint(equalTo: view.topAnchor, constant: 16),
            termsText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            termsText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            termsText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
        ])
    }
    
}
