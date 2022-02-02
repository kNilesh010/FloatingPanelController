//
//  ViewController.swift
//  FloatingPanelSwift
//
//  Created by Nilesh Kumar on 02/02/22.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController {
    
    let vc = secondViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        let floatingController = FloatingPanelController()
        floatingController.set(contentViewController: vc)
        floatingController.addPanel(toParent: self)
    }


}

class secondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    var cities: [String] = ["New Delhi", "Mumbai", "Chandigarh", "Bengaluru", "Manali"]
    
    
    private let table: UITableView = {
        let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.delegate = self
        table.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = CGRect(x: 0, y: 50, width: view.frame.size.width, height: view.frame.size.height)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cities[indexPath.row]
        return cell
    }
    
}
