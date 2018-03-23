//
//  OutGoingChatTableViewCell.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/13/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit

class OutGoingChatTableViewCell: UITableViewCell {

    @IBOutlet weak var messageLabelSuperView: UIView!
    @IBOutlet weak var triangleView: TriangleView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        messageLabelSuperView.layer.cornerRadius = 10.0
        messageLabelSuperView.backgroundColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1)
        messageLabel.backgroundColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1)
        triangleView.fillColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1)
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        triangleView.transform = CGAffineTransform(rotationAngle: CGFloat(-55))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(outgoingBubbleViewBackgroundColor: UIColor = #colorLiteral(red: 0.6707953262, green: 0.81270354, blue: 1, alpha: 1), outgoingBubbleViewTextColor: UIColor = .black, shouldShowProfileImage: Bool = true, messageFont: UIFont = UIFont(name: "HelveticaNeue", size: 15.0)!, userNameFont: UIFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)!) {
        messageLabelSuperView.backgroundColor = outgoingBubbleViewBackgroundColor
        triangleView.fillColor = outgoingBubbleViewBackgroundColor.cgColor
        messageLabel.backgroundColor = outgoingBubbleViewBackgroundColor
        messageLabel.textColor = outgoingBubbleViewTextColor
        messageLabel.font = messageFont
        nameLabel.font = userNameFont
        profileImageView.isHidden = !shouldShowProfileImage
    }

    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> OutGoingChatTableViewCell {
        let kOutGoingChatTableViewCellIdentifier = "kOutGoingChatTableViewCellIdentifier"
        tableView.register(UINib(nibName: "OutGoingChatTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kOutGoingChatTableViewCellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: kOutGoingChatTableViewCellIdentifier, for: indexPath) as! OutGoingChatTableViewCell

        return cell
    }
}
