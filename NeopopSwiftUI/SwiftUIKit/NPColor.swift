//
//  NPColor.swift
//  NeopopSwiftUI
//
//  Created by Utkarsh Dayal on 08/11/21.
//

import UIKit
public extension UIColor {
    @inline(__always) static func fromHex(_ hex: String, alpha opacity: CGFloat? = nil) -> UIColor {
        // following ARGB color hex. same as android
        let colorCode = hex.suffix(6)
        let hexint = Int(intFromHexString(hexStr: String(colorCode)))
        let red: CGFloat = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha: CGFloat
        if hex.count >= 8 {
            let alphaCode = hex.suffix(8).prefix(2)
            let alphaHexInt = Int(intFromHexString(hexStr: String(alphaCode)))
            alpha = opacity ?? CGFloat(alphaHexInt & 0xff) / 255.0
        } else {
            alpha = opacity ?? 1.0
        }
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

    static func intFromHexString(hexStr: String) -> UInt32 {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hexStr)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        return hexInt
    }

    @inline(__always) convenience init(fromHex hex: String, alpha opacity: CGFloat? = nil) {
        // following ARGB color hex. same as android
        let colorCode = hex.suffix(6)
        let hexint = Int(UInt32(fromHex: String(colorCode)))
        let red: CGFloat = CGFloat((hexint & 0xff0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hexint & 0xff00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((hexint & 0xff) >> 0) / 255.0
        let alpha: CGFloat
        if hex.count >= 8 {
            let alphaCode = hex.suffix(8).prefix(2)
            let alphaHexInt = Int(UInt32(fromHex: String(alphaCode)))
            alpha = opacity ?? CGFloat(alphaHexInt & 0xff) / 255.0
        } else {
            alpha = opacity ?? 1.0
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

public extension UInt32 {
    init(fromHex hex: String) {
        var hexInt: UInt32 = 0
        // Create scanner
        let scanner: Scanner = Scanner(string: hex)
        // Tell scanner to skip the # character
        scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")
        // Scan hex value
        scanner.scanHexInt32(&hexInt)
        self = hexInt
    }
}

public extension UIColor {

    func lighter(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: abs(percentage) )
    }

    func darker(by percentage: CGFloat = 30.0) -> UIColor? {
        return self.adjust(by: -1 * abs(percentage) )
    }

    func adjust(by percentage: CGFloat = 30.0) -> UIColor? {
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 0
        if self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
            let percent = percentage / 100
            return UIColor(red: min(red + percent, 1.0),
                           green: min(green + percent, 1.0),
                           blue: min(blue + percent, 1.0),
                           alpha: alpha)
        } else {
            return nil
        }
    }
}

public struct NPColor {

    //MARK: Base Colors
    public static let popWhite100 = UIColor.fromHex("D2D2D2")
    public static let popWhite200 = UIColor.fromHex("E0E0E0")
    public static let popWhite300 = UIColor.fromHex("EFEFEF")
    public static let popWhite400 = UIColor.fromHex("FBFBFB")
    public static let popWhite500 = UIColor.fromHex("FFFFFF")

    // alpha variants for popWhite500
    public static let popWhite500_30 = popWhite500.withAlphaComponent(0.3)
    public static let popWhite500_50 = popWhite500.withAlphaComponent(0.5)
    public static let popWhite500_70 = popWhite500.withAlphaComponent(0.7)
    public static let popWhite500_90 = popWhite500.withAlphaComponent(0.9)

    public static let popBlack100 = UIColor.fromHex("8A8A8A")
    public static let popBlack200 = UIColor.fromHex("3D3D3D")
    public static let popBlack300 = UIColor.fromHex("161616")
    public static let popBlack400 = UIColor.fromHex("121212")
    public static let popBlack500 = UIColor.fromHex("0D0D0D")

    // alpha variants for popBlack500
    public static let popBlack500_30 = popBlack500.withAlphaComponent(0.3)
    public static let popBlack500_50 = popBlack500.withAlphaComponent(0.5)
    public static let popBlack500_70 = popBlack500.withAlphaComponent(0.7)
    public static let popBlack500_90 = popBlack500.withAlphaComponent(0.9)

    //MARK: State Colors

    public static let errorRed100 = UIColor.fromHex("FCE2DD")
    public static let errorRed200 = UIColor.fromHex("F6A69B")
    public static let errorRed300 = UIColor.fromHex("F47564")
    public static let errorRed400 = UIColor.fromHex("F05E4B")
    public static let errorRed500 = UIColor.fromHex("EE4D37")

    public static let warningYellow100 = UIColor.fromHex("FBDDC2")
    public static let warningYellow200 = UIColor.fromHex("F8C699")
    public static let warningYellow300 = UIColor.fromHex("F5AC6A")
    public static let warningYellow400 = UIColor.fromHex("F29947")
    public static let warningYellow500 = UIColor.fromHex("F08D32")

    public static let infoBlue100 = UIColor.fromHex("C2D0F2")
    public static let infoBlue200 = UIColor.fromHex("89A5E3")
    public static let infoBlue300 = UIColor.fromHex("3F6FD9")
    public static let infoBlue400 = UIColor.fromHex("2C5ECD")
    public static let infoBlue500 = UIColor.fromHex("144CC7")

    public static let successGreen100 = UIColor.fromHex("B4EDD4")
    public static let successGreen200 = UIColor.fromHex("83E0B8")
    public static let successGreen300 = UIColor.fromHex("4FE3A3")
    public static let successGreen400 = UIColor.fromHex("1FC87F")
    public static let successGreen500 = UIColor.fromHex("06C270")

    //MARK: Colors
    public static let poliPurpule100 = UIColor.fromHex("E8DFFF")
    public static let poliPurpule200 = UIColor.fromHex("D2C2FF")
    public static let poliPurpule300 = UIColor.fromHex("B49AFF")
    public static let poliPurpule400 = UIColor.fromHex("9772FF")
    public static let poliPurpule500 = UIColor.fromHex("6A35FF")
    public static let poliPurpule600 = UIColor.fromHex("4A25B3")
    public static let poliPurpule700 = UIColor.fromHex("351A80")
    public static let poliPurpule800 = UIColor.fromHex("20104D")

    public static let rssOrange100 = UIColor.fromHex("FFEFE6")
    public static let rssOrange200 = UIColor.fromHex("FFDBC7")
    public static let rssOrange300 = UIColor.fromHex("FFC3A2")
    public static let rssOrange400 = UIColor.fromHex("FFAB7C")
    public static let rssOrange500 = UIColor.fromHex("FF8744")
    public static let rssOrange600 = UIColor.fromHex("B35F30")
    public static let rssOrange700 = UIColor.fromHex("804322")
    public static let rssOrange800 = UIColor.fromHex("4D2914")

    public static let pinkPong100 = UIColor.fromHex("FFE1E9")
    public static let pinkPong200 = UIColor.fromHex("FFC6D4")
    public static let pinkPong300 = UIColor.fromHex("FFC6D4")
    public static let pinkPong400 = UIColor.fromHex("FF7B9A")
    public static let pinkPong500 = UIColor.fromHex("FF426F")
    public static let pinkPong600 = UIColor.fromHex("B32E4E")
    public static let pinkPong700 = UIColor.fromHex("802138")
    public static let pinkPong800 = UIColor.fromHex("4D1421")

    public static let mannna100 = UIColor.fromHex("FFF8E5")
    public static let mannna200 = UIColor.fromHex("FFEFC7")
    public static let mannna300 = UIColor.fromHex("FFE5A2")
    public static let mannna400 = UIColor.fromHex("FFDB7D")
    public static let mannna500 = UIColor.fromHex("FFCB45")
    public static let mannna600 = UIColor.fromHex("B38E30")
    public static let mannna700 = UIColor.fromHex("806623")
    public static let mannna800 = UIColor.fromHex("4D3D15")

    public static let neoPacha100 = UIColor.fromHex("FBFFE6")
    public static let neoPacha200 = UIColor.fromHex("F7FFC6")
    public static let neoPacha300 = UIColor.fromHex("F2FF9F")
    public static let neoPacha400 = UIColor.fromHex("EDFE79")
    public static let neoPacha500 = UIColor.fromHex("E5FE40")
    public static let neoPacha600 = UIColor.fromHex("A0B22D")
    public static let neoPacha700 = UIColor.fromHex("727F20")
    public static let neoPacha800 = UIColor.fromHex("454C13")

    public static let yoyo100 = UIColor.fromHex("F4E5FF")
    public static let yoyo200 = UIColor.fromHex("E5C5FF")
    public static let yoyo300 = UIColor.fromHex("D59FFF")
    public static let yoyo400 = UIColor.fromHex("C379FF")
    public static let yoyo500 = UIColor.fromHex("AA3FFF")
    public static let yoyo600 = UIColor.fromHex("772CB3")
    public static let yoyo700 = UIColor.fromHex("552080")
    public static let yoyo800 = UIColor.fromHex("33134D")
}
