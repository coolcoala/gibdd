//
//  API.swift
//  gibdd
//
//  Created by Sova on 09.07.2024.
//

import Foundation

class apiCall {
    func getAnswers(completion:@escaping ([Answers]) -> ()) {
        let url = URL(string: "https://raw.githubusercontent.com/etspring/pdd_russia/master/questions/A_B/tickets/Билет 1.json")!
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let answers = try! JSONDecoder().decode([Answers].self, from: data!)
            print(answers)
            
            DispatchQueue.main.async {
                completion(answers)
            }
        }
        .resume()
    }
}
