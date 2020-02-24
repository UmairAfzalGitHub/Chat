//
//  Message.swift
//  CustomChat
//
//  Created by Umair Afzal on 24/02/2020.
//  Copyright © 2020 Umair Afzal. All rights reserved.
//

import Foundation
import UIKit

class Message {
    var id = ""
    var message = ""
    var messageType: MessageType = .text
    var profileImageUrl = ""
    var messageImage = #imageLiteral(resourceName: "vertical_panorama_by_verticaldubai-d3gp1ja")
    var messageImageUrl = ""
    var senderName = ""
    var senderId = ""
}

enum MessageType: String {
    case text
    case image
}
