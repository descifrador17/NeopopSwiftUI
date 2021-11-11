//
//  NeopopModels.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 08/11/21.
//

import Foundation
import UIKit

public struct NeopopButtonModel{
    var buttonHeight: CGFloat? = 50
    
    var buttonWidth: CGFloat?
    
    var leftImage: UIImage?
    
    var rightImage: UIImage?
    
    var fontName: String?
    
    var fontSize: CGFloat?
    
    var fontColor: UIColor? = NPColor.popWhite500
    
    var backgroundColor: UIColor? = NPColor.popBlack500
    
    var edgeThickness: CGFloat? = 10
    
    var edgeColor: UIColor? = NPColor.popBlack200
    
    var borderWidth: CGFloat?
    
    var borderColor: UIColor?
    
    var shadowColor: UIColor? = NPColor.popBlack500
    
    var loadingLottieName: String?
    
    var buttonDirection: NeopopButtonDirection
}

public enum NeopopButtonDirection{
    case topLeft, topEdge, topRight, leftEdge, rightEdge, bottomLeft, bottomEdge, bottomRight
}

/*
 * This state is change between,
 * 1. normal - normal state. //user interaction enabeld
 * 3. animating - loading state //user inteaction will be disabled
 */
public enum NeopopButtonState {
    case normal, animating
}
