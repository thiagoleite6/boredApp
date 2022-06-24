//
//  ActivitiesViewController.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 20/06/22.
//

import UIKit

class ActivitiesViewController: UIViewController, ActivitiesViewProtocol {
    
    private var categories: [ActivityCategory] = [
        ActivityCategory(id: 1, name: "education"),
        ActivityCategory(id: 2, name: "recreational"),
        ActivityCategory(id: 3, name: "social"),
        ActivityCategory(id: 4, name: "diy"),
        ActivityCategory(id: 5, name: "charity"),
        ActivityCategory(id: 6, name: "cooking"),
        ActivityCategory(id: 7, name: "relaxation"),
        ActivityCategory(id: 8, name: "music"),
        ActivityCategory(id: 9, name: "busywork"),
    ]
    
    private let activitiesView = ActivitiesView()
    
    private let service = ActivityService()
    
    var activity: Activity?
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activitiesView.delegate = self
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Methods
    
    private func configureUI() {
        view = activitiesView
        view.backgroundColor = .white
        activitiesView.configTableViewDelegate(delegate: self, dataSource: self)
    }
    
    func handleBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    func handleRandomButton() {
        let suggestionVC = SuggestionsViewController(activityCategory: "Random")
        navigationController?.pushViewController(suggestionVC, animated: true)
    }
    
}
    //MARK: - UITableViewDataSource

extension ActivitiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ActivityTableViewCell.identifier, for: indexPath) as? ActivityTableViewCell
        
        cell?.setupCell(category: categories[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    
}
    //MARK: - UITableViewDelegate

extension ActivitiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        let suggestionVC = SuggestionsViewController(activityCategory: category.name)
        navigationController?.pushViewController(suggestionVC, animated: true)
    }
}
