//
//  ViewController.swift
//  WhitehousePetitions
//
//  Created by Tan Zhi Yang on 14/7/19.
//  Copyright © 2019 Tan Zhi Yang. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    var originalPetitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let urlString: String
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dataAlert))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterPetitions))
        
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "http://www.hackingwithswift.com/samples/petitions-1.json"
            title = "MOST RECENT"
        } else {
            urlString = "http://www.hackingwithswift.com/samples/petitions-2.json"
            title = "TOP RATED"
        }
        
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url){
                // Ok to pass
                parse(json: data)
                return
            }
        }
        showError()
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func filterPetitions() {
        let ac = UIAlertController(title: "Filter", message: "Searching for certain petitions?", preferredStyle: .alert)
        ac.addTextField()
        
        let submitAction = UIAlertAction(title: "Submit", style: .default) { [weak self, weak ac] action in
            guard let answer = ac?.textFields?[0].text else { return }
            print(ac?.textFields)
            self?.filter(answer)
        }
        
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    func filter(_ ans: String) {
        petitions.removeAll()
        for petition in originalPetitions {
            if petition.search(word: ans){
                petitions.append(petition)
            }
        }
        tableView.reloadData()
    }
    
    @objc func dataAlert(){
        let ac = UIAlertController(title: "Credits", message: "This data comes from We The People API of the Whitehouse.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Back", style: .cancel))
        present(ac, animated: true)
    }
    
    // Calls JSONDecoder to decode JSON -> loads into petitions var
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        // Petitions.self is like Petitions.class in Android
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            originalPetitions = petitions
            tableView.reloadData()
        }
    }
    
    func showError() {
        let ac = UIAlertController(title: "Loading error", message: "There was a problem loading the feed.", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Back", style: .default))
        present(ac, animated: true)
    }
    
    


}

