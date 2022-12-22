//
//  ViewController.swift
//  OTUS-GPB-URLSESSION-HW
//
//  Created by Aleksandr Chebotarev on 12/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // MARK: - Properties
    private var viewModels = [TableViewCellViewModel]() {
        didSet {
            viewModels.sort(by: { $0.name < $1.name })
        }
    }
    let identifier = "datacell"
    
    // MARK: - viewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchModel()
    }
    
    
    // MARK: - Private Methods
    private func fetchModel() {
        Parser.shared.getData { model in
            self.viewModels = model.company.employees.compactMap({
                TableViewCellViewModel(name: $0.name, number: $0.number, skills: $0.skills)
            })
            self.tableView.reloadData()
        }
    }
}

// MARK: - ViewController Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = (tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? TableViewCell) else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
}


