//
//  TipoTableViewCell.swift
//  Wchair
//
//  Created by Vitor on 6/20/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

import UIKit

class TipoTableViewCell: UITableViewCell {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var nome: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
