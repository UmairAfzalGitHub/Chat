//
//  TriangleView.swift
//  CustomChat
//
//  Created by Umair Afzal on 24/02/2020.
//  Copyright © 2020 Umair Afzal. All rights reserved.
//

import Foundation
import UIKit

class TriangleView : UIView {

    var fillColor = UIColor.red.cgColor

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: (rect.maxX / 2.0), y: rect.minY))
        context.closePath()

        context.setFillColor(fillColor)
        context.fillPath()
    }
}
