//
//  SuggestionsViewController.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 22/06/22.
//

import UIKit

class SuggestionsViewController: UITabBarController, SuggestionsViewProtocol {
   
    private let suggestionsView = SuggestionsView()
    
    let service = ActivityService()
    
    var activityCategory: String
    
    //MARK: - Lifecycle
    
    init(activityCategory: String) {
        self.activityCategory = activityCategory
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        suggestionsView.delegate = self
        configureUI()
    }
      
    override func viewWillAppear(_ animated: Bool) {
        getDataByScreenOption()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Methods
    
    func getDataByScreenOption() {
        if activityCategory == "Random" {
            getRandomData()
        } else {
            fetchDataByCategory(categoryName: activityCategory)
        }
    }
    
    private func configureUI() {
        view = suggestionsView
        view.backgroundColor = .white
        suggestionsView.titleLabel.text = activityCategory.capitalized
       
    }
    
    func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleTryAnotherButton() {
        getDataByScreenOption()
    }
  
    func updateInfo(suggestionTitle: String, participants: Int, type: String, price: String) {
        DispatchQueue.main.async {
            self.suggestionsView.suggestionTitle.text = suggestionTitle
            self.suggestionsView.numberOfParticipants.text = String(participants)
            self.suggestionsView.typeLabel.text = type.capitalized
            self.suggestionsView.price.text = price
    
            
            self.reloadInputViews()
        }
    }
    
    func fetchDataByCategory(categoryName: String) {
        service.fetchDataByActivity(title: categoryName) { activity, error in
            guard let activity = activity else { return print(error) }
            self.updateInfo(suggestionTitle: activity.activity, participants: activity.participants, type: activity.type, price: activity.priceRate)
        }
    }
    
    private func getRandomData() {
        service.fetchRandomData { activity, error in
            guard let activity = activity else { return print(error) }
            self.updateInfo(suggestionTitle: activity.activity, participants: activity.participants, type: activity.type, price: activity.priceRate)
        }
    }
    
}
