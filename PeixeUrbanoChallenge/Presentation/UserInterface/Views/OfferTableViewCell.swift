//
//  OfferCityTableViewCell.swift
//  PeixeUrbanoChallenge
//
//  Created by Gustavo Henrique on 26/02/19.
//  Copyright © 2019 Gustavo Henrique. All rights reserved.
//

import UIKit

class OfferTableViewCell: UITableViewCell {

    @IBOutlet weak var offerImageView: UIImageView!
    @IBOutlet weak var offerNameLabel: UILabel!
    @IBOutlet weak var offerPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(offer: Offer) {
        self.offerImageView.downloaded(from: (offer.dealOriginalImage)!)
        self.offerNameLabel.text = offer.title
        self.offerPriceLabel.text = String(describing: (offer.salePrice)!)
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
