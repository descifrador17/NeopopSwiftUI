//
//  NeopopHelper.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 08/11/21.
//

import UIKit

public struct NeopopHelper {
    
    public struct StandardButtons{
        public enum Style {
            case light
            case dark

            func bgColor() -> UIColor {
                switch self {
                case .light:
                    return NPColor.popWhite500
                case .dark:
                    return NPColor.popBlack500
                }
            }

            func textColor () -> UIColor {
                switch self {
                case .light:
                    return NPColor.popBlack500
                case .dark:
                    return NPColor.popWhite500
                }
            }
            
            func edgeColor () -> UIColor {
                switch self {
                case .light:
                    return NPColor.popWhite200
                case .dark:
                    return NPColor.popBlack200
                }
            }

            func arrowImage() -> UIImage? {
                switch self {
                case .light:
                    return UIImage(named: "curved_arrow_right_dark")
                case .dark:
                    return UIImage(named: "curved_arrow_right_light")
                }
            }
            
            func loadingLottie() -> String? {
                switch self {
                case .light:
                    return "cta_load_dark"
                case .dark:
                    return "cta_load_light"
                }
            }
        }
    }
    
    //MARK: Primary Plunk Buttons
    public static func primary50_plunk_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 50, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 14, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: nil, borderColor: nil, loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    public static func primary40_plunk_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 40, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 12, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: nil, borderColor: nil, loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    //MARK: Primary Flat Buttons
    public static func primary50_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 50, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 14, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: nil, borderColor: nil, loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    public static func primary40_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 40, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 12, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: nil, borderColor: nil, loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    public static func primary30_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 30, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 10, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: nil, borderColor: nil, loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    //MARK: Secondary Buttons
    public static func secondary50_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 50, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 14, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: 1, borderColor: style.textColor(), loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    public static func secondary40_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 40, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 12, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: 1, borderColor: style.textColor(), loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
    
    public static func secondary30_flat_button_model(style: StandardButtons.Style) -> NeopopButtonModel {
        return NeopopButtonModel(buttonHeight: 30, buttonWidth: UIScreen.main.bounds.width - 60, leftImage: nil, rightImage: style.arrowImage(), fontName: "NotoSansMyanmar-Bold", fontSize: 10, fontColor: style.textColor(), backgroundColor: style.bgColor(), edgeThickness: 5, edgeColor: style.edgeColor(), borderWidth: 1, borderColor: style.textColor(), loadingLottieName: style.loadingLottie(), buttonDirection: .bottomRight)
    }
}
