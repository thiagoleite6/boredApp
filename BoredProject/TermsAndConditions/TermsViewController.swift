//
//  TermsViewController.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 21/06/22.
//

import UIKit

class TermsViewController: UIViewController, TermsProtocol {
  
    private let terms = Terms()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        terms.delegate = self
        configureUI()
        
    }
    
    private func configureUI() {
        view = terms
        view.backgroundColor = UIColor(red: 0.94, green: 0.91, blue: 0.98, alpha: 1.00)
    }


    func tappedCloseButton() {
        self.dismiss(animated: true)
    }

}
