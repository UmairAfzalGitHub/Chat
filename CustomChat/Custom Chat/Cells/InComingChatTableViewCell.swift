//
//  InComingChatTableViewCell.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/13/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import UIKit

class InComingChatTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var triangleView: TriangleView!
    @IBOutlet weak var messageLabelSuperView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabelSuperView.layer.cornerRadius = 10.0
        messageLabelSuperView.backgroundColor = .red
        messageLabel.backgroundColor = .red
        profileImageView.layer.cornerRadius = profileImageView.frame.height/2
        profileImageView.clipsToBounds = true
        self.selectionStyle = .none
        triangleView.transform = CGAffineTransform(rotationAngle: CGFloat(55))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(incomingBubbleViewBackgroundColor: UIColor = .red, incomingBubbleViewTextColor: UIColor = .black, shouldShowProfileImage: Bool = true, messageFont: UIFont = UIFont(name: "HelveticaNeue", size: 15.0)!, userNameFont: UIFont = UIFont(name: "HelveticaNeue-Bold", size: 15.0)!) {
        messageLabelSuperView.backgroundColor = incomingBubbleViewBackgroundColor
        triangleView.fillColor = incomingBubbleViewBackgroundColor.cgColor
        messageLabel.backgroundColor = incomingBubbleViewBackgroundColor
        messageLabel.textColor = incomingBubbleViewTextColor
        messageLabel.font = messageFont
        nameLabel.font = userNameFont
        profileImageView.isHidden = !shouldShowProfileImage
    }

    class func cellForTableView(tableView: UITableView, atIndexPath indexPath: IndexPath) -> InComingChatTableViewCell {
        let kInComingChatTableViewCellIdentifier = "kInComingChatTableViewCellIdentifier"
        tableView.register(UINib(nibName: "InComingChatTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: kInComingChatTableViewCellIdentifier)

        let cell = tableView.dequeueReusableCell(withIdentifier: kInComingChatTableViewCellIdentifier, for: indexPath) as! InComingChatTableViewCell

        return cell
    }

}
