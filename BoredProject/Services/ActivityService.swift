//
//  ActivityService.swift
//  BoredProject
//
//  Created by Thiago Almeida Leite on 23/06/22.
//

import Foundation

protocol ActivityServiceProtocol {
    func fetchRandomData(completion: @escaping (Activity?, String?) -> Void)
    func fetchDataByActivity(title: String, completion: @escaping (Activity?, String?) -> Void)
}

class ActivityService: ActivityServiceProtocol {
    let url_base = "http://www.boredapi.com/api/activity"
    
    func fetchRandomData(completion: @escaping (Activity?, String?) -> Void) {
        let session = URLSession.shared
        let url = URL(string: url_base)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let result = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Activity.self, from: result)
                completion(response, nil)
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(nil, error.localizedDescription)
            }
        }
        
        task.resume()
    }
    
    func fetchDataByActivity(title: String, completion: @escaping (Activity?, String?) -> Void) {
        let url_request = "\(url_base)?type=\(title)"
        let session = URLSession.shared
        let url = URL(string: url_request)
        let task = session.dataTask(with: url!) { data, response, error in
            guard let result = data else { return }
            
            do {
                let response = try JSONDecoder().decode(Activity.self, from: result)
                completion(response, nil)
            } catch {
                print("JSON error: \(error.localizedDescription)")
                completion(nil, error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
