//
//  CollectionViewCell.swift
//  be cool
//
//  Created by deepo on 4/9/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titlename: UILabel!

    @IBOutlet weak var simage: UIImageView!
    
    var isEditing :Bool = false {
        
        didSet {
            simage.isHidden = !isEditing
        }
        
    }
    
override var isSelected: Bool
    {
    didSet{
        if isEditing
        {
            simage.image = isSelected ? UIImage(named: "check") : UIImage(named: "uncheck")
        }
        
    }
    
    }
    
}
