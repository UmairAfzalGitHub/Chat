//
//  InComingChatImageTableViewCell.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/17/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit

class InComingChatImageTableViewCell: UITableViewCell {

    @IBOutlet weak var messageImageSuperView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var triangleView: TriangleView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        messageImageSuperView.layer.cornerRadius = 10.0
        messageImageView.layer.cornerRadius = 10.0
        messageImageView.clipsToBounds = true
        messageImageSuperView.backgroundColor = .red
        triangleView.fillColor = UIColor.red.cgColor
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        triangleView.transform = CGAffineTransform(rotationAngle: CGFloat(55))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> InComingChatImageTableViewCell {
        let kInComingChatImageTableViewCellIdentifier = "kInComingChatImageTableViewCellIdentifier"
        tableView.register(UINib(nibName: "InComingChatImageTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kInComingChatImageTableViewCellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: kInComingChatImageTableViewCellIdentifier, for: indexPath) as! InComingChatImageTableViewCell

        return cell
    }
}
