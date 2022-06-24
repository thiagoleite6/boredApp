//
//  HomeViewController.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 17/06/22.
//

import UIKit

class HomeViewController: UIViewController, HomeScreenProtocol {
       
    private let home = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        home.delegate = self
    }
    
    private func configureUI() {
        view = home
        view.backgroundColor = .white
//        view.backgroundColor = UIColor(red: 0.83, green: 0.85, blue: 1.00, alpha: 1.00)
    }
    
    func actionStartButton() {
        let activitiesViewController = ActivitiesViewController()
        self.navigationController?.pushViewController(activitiesViewController, animated: true)
    }
    
    func actionTermsAndConditionsButton() {
        let termsVC = TermsViewController()
        termsVC.modalPresentationStyle = .fullScreen
        self.present(termsVC, animated: true)
    }
}
