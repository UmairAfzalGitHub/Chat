//
//  ChatFooterView.swift
//  CustomChat
//
//  Created by Umair Afzal on 2/14/18.
//  Copyright © 2018 Umair Afzal. All rights reserved.
//

import Foundation
import UIKit

class ChatFooterView: UIView {

    class func instanceFromNib() -> ChatFooterView {
        return UINib(nibName: "ChatFooterView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ChatFooterView
    }
}
