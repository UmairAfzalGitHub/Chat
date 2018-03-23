//
//  OutGoingChatImageTableViewCell.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/17/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit

class OutGoingChatImageTableViewCell: UITableViewCell {

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
        messageImageSuperView.backgroundColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1)
        triangleView.fillColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        triangleView.transform = CGAffineTransform(rotationAngle: CGFloat(-55))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> OutGoingChatImageTableViewCell {
        let kOutGoingChatImageTableViewCellIdentifier = "kOutGoingChatImageTableViewCellIdentifier"
        tableView.register(UINib(nibName: "OutGoingChatImageTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kOutGoingChatImageTableViewCellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: kOutGoingChatImageTableViewCellIdentifier, for: indexPath) as! OutGoingChatImageTableViewCell

        return cell
    }
}
