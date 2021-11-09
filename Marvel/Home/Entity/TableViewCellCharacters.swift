//
//  TableViewCellCharacters.swift
//  Marvel
//
//  Created by macbook-estagio on 05/05/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class TableViewCellCharacters: UITableViewCell {
    
    let labelName : UILabel = {
        let label = UILabel()
        label.setBasicLabel(text: "Searching Heros ...", textColor: UIColor.black,
                            font: 22, backgroundColor: .clear, textAlignment: .left)
        return label
    }()
    
    let imageCharacter: UIImageView = {
        let imageView = UIImageView()
//        imageView.setImage(name: "marvelLogo", x: 0, y: 0, width: 0, height: 0)
        let image = UIImage(named: "marvelLogo")
        imageView.image = image
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
//        imageView.image = image?.imageWithInset(insets: UIEdgeInsets(top: 10, left: 10, bottom: -10, right: -10))
        let imageInsets: CGFloat = 2
        imageView.image = image?.resizableImage(withCapInsets: UIEdgeInsets(top: imageInsets, left: imageInsets, bottom: imageInsets, right: imageInsets), resizingMode: .stretch)
//
        return imageView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
//        contentView.addSubviews(viewsToAdd: labelName)
        contentView.addSubviews(viewsToAdd: labelName, imageCharacter)
        
        imageCharacter.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(40)
            make.left.equalToSuperview().offset(10)
        }
        labelName.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(imageCharacter.snp.right).offset(10)
        }
        
        
    }

}
