//
//  TVC.swift
//  ChatGraphQl
//
//  Created by Azizbek Salimov on 30.05.2022.
//

import UIKit

class TVC: UITableViewCell {

    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var messageFromLbl: UILabel!
    @IBOutlet weak var img: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
