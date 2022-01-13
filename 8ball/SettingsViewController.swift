//
//  SettingsViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        view.addSubview(table)
        
        table.dataSource = self
        table.backgroundColor = .blue
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addTap))
        
    }
    
            
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    

    @objc private func addTap() {
        let alert = UIAlertController(
            title: "My answers",
            message: "Set and save answers",
            preferredStyle: .alert)
    
        alert.addTextField { field in
            field.placeholder = "Enter answer....."
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: {_ in
            guard let field = alert.textFields?.first else { fatalError() }
            guard let text = field.text, !text.isEmpty else { fatalError() }
            
            print(text)
        }))
        
        present(alert, animated: true)
    }
}


extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
}
