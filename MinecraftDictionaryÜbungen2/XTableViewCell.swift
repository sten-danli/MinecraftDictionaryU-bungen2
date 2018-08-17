//
//  XTableViewCell.swift
//  MinecraftDictionaryÜbungen2
//
//  Created by Dan Li on 31.07.18.
//  Copyright © 2018 DanStenLee. All rights reserved.
//

import UIKit

class XTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImageView: UIImageView!
    
    @IBOutlet weak var characterNameLabel: UILabel!
    
    @IBOutlet weak var characterInfoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(modeleData:ModelData){
        characterImageView.image=modeleData.image
        characterNameLabel.text=modeleData.name
        characterInfoLabel.text=modeleData.info
    }

}
