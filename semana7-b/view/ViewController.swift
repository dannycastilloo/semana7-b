//
//  ViewController.swift
//  semana7-b
//
//  Created by MAC37 on 13/05/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Task {
            await homeViewModel.loadData()
            tableView.reloadData()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.toDos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        var contentConfiguration = UIListContentConfiguration.cell()
        contentConfiguration.text = homeViewModel.toDos[indexPath.row].title
        cell.contentConfiguration = contentConfiguration
        return cell
    }
    
}
