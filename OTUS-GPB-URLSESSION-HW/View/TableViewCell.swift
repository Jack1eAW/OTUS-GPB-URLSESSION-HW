//
//  TableViewCell.swift
//  OTUS-GPB-URLSESSION-HW
//
//  Created by Aleksandr Chebotarev on 12/22/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var skillsLabel: UILabel!
    // MARK: - Methods
    
    func configure(with viewModel: TableViewCellViewModel) {
        nameLabel.text = viewModel.name
        numberLabel.text = viewModel.number
        skillsLabel.text = viewModel.skills.joined(separator: ", ")
    }
    
    override func awakeFromNib(){
        super.awakeFromNib()
    }
}

struct TableViewCellViewModel {
    let name: String
    let number: String
    let skills: [String]
}
