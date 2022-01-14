//
//  SettingsViewController.swift
//  8ball
//
//  Created by Sergey Lukaschuk on 13.01.2022.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {

    var listAnswers: [String] = ["Just do it!", "You rock!", "All or nothing."]
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listAnswers += UserDefaults.standard.stringArray(forKey: "items") ?? []
        table.dataSource = self
        table.backgroundColor = .black
        title = "Settings"
        view.addSubview(table)
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
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self] (_) in
            guard let field = alert.textFields?.first else { fatalError() }
            guard let text = field.text, !text.isEmpty else { fatalError() }
            
            DispatchQueue.main.async {
                var currentItems = UserDefaults.standard.stringArray(forKey: "items") ?? []
                currentItems.append(text)
                UserDefaults.standard.setValue(currentItems, forKey: "items")
                self?.listAnswers.append(text)
                self?.table.reloadData()
            }
        }))
        present(alert, animated: true)
    }
}


extension SettingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listAnswers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listAnswers[indexPath.row]
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        return cell
    }
}
