//
//  TableViewCell.swift
//  News
//
//  Created by Tolga on 5.11.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var publishDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
