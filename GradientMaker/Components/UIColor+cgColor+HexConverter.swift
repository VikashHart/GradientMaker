import UIKit

// MARK: - Hex to UIColor converter (don't touch)
extension UIColor {
    convenience init? (hexString: String) {
        let hexString = hexString.trimmingCharacters(in: CharacterSet.punctuationCharacters)
        let filteredStr = hexString.filter{"aAbBcCdDeEfF0123456789".contains($0)}

        guard hexString.count == filteredStr.count, hexString.count == 6 else {
            return nil
        }

        let positionR = hexString.index(hexString.startIndex, offsetBy: 2)
        let positionG = hexString.index(hexString.startIndex, offsetBy: 4)

        guard let r = Double("0x" + hexString[..<positionR]),
            let g = Double("0x" + hexString[positionR..<positionG]),
            let b = Double("0x" + hexString[positionG...]) else { return nil }

        self.init(red:   CGFloat(r / 255),
                  green: CGFloat(g / 255),
                  blue:  CGFloat(b / 255),
                  alpha: 1)
    }
}

// MARK: - Custom UIColors
// To use just follow the format below and input your hex value in the quotes
extension UIColor {
    // Black
    static let licorice   = UIColor(hexString: "121113")!
    static let lightBlack = UIColor(hexString: "434343")!
    // Gray
    static let stone     = UIColor(hexString: "868f96")!
    static let cloudy    = UIColor(hexString: "d7d2cc")!
    static let fog       = UIColor(hexString: "ebedee")!
    // Purple
    static let indigo    = UIColor(hexString: "3f5efb")!
    static let plum      = UIColor(hexString: "5c258d")!
    static let amethyst  = UIColor(hexString: "9d50bb")!
    static let violet    = UIColor(hexString: "3B0066")!
    // Blue
    static let bluejay   = UIColor(hexString: "00d2ff")!
    static let blueberry = UIColor(hexString: "3a7bd5")!
    static let ocean     = UIColor(hexString: "219DFF")!
    static let lightBlue = UIColor(hexString: "c7eafd")!
    static let seafoam   = UIColor(hexString: "00ecbc")!
    // Green
    static let clover    = UIColor(hexString: "0f9b0f")!
    static let grass     = UIColor(hexString: "a8e063")!
    static let lime      = UIColor(hexString: "24fe41")!
    static let limerick  = UIColor(hexString: "a2c115")!
    static let spring    = UIColor(hexString: "0fd850")!
    static let kindaGreen = UIColor(hexString: "50cc7f")!
    // Yellow
    static let gold      = UIColor(hexString: "D4AF37")!
    static let lemon     = UIColor(hexString: "f9f047")!
    static let marigold  = UIColor(hexString: "F6AE2D")!
    static let mustard  = UIColor(hexString: "F5DE45")!
    // Orange
    static let tangerine = UIColor(hexString: "fe8c00")!
    static let lightOrange = UIColor(hexString: "f6d365")!
    static let sunrise = UIColor(hexString: "fc4a1a")!
    static let bloodOrange = UIColor(hexString: "f00000")!
    // Red
    static let tomato    = UIColor(hexString: "f83600")!
    static let fullRed   = UIColor(hexString: "ff0000")!
    static let lightRed  = UIColor(hexString: "eb5757")!
    static let bloodRed  = UIColor(hexString: "#870000")!
    // Pink
    static let pink      = UIColor(hexString: "ec77ab")!
    static let lightPink = UIColor(hexString: "f4c4f3")!
    static let candy     = UIColor(hexString: "e5b2ca")!
}

// MARK: - Custom cgColor arrays
// To use, just follow the format below and create arrays of cgColors.
// Use the format UIColor."INSERT UIColor NAME HERE".cgColor
extension CGColor {
    // Color Set for collection view
    static let colorSet1 = [CGColor.blacks, CGColor.grays, CGColor.whites, CGColor.purples, CGColor.blues, CGColor.greens, CGColor.golds, CGColor.oranges, CGColor.reds, CGColor.pinks]
    // Add your custom colors below

    // Sample colors
    static let blacks  = [UIColor.lightBlack.cgColor, UIColor.black.cgColor]
    static let grays   = [UIColor.cloudy.cgColor, UIColor.stone.cgColor]
    static let whites  = [UIColor.white.cgColor, UIColor.fog.cgColor]
    static let purples = [UIColor.indigo.cgColor, UIColor.plum.cgColor]
    static let blues   = [UIColor.bluejay.cgColor, UIColor.blueberry.cgColor]
    static let greens  = [UIColor.green.cgColor, UIColor.spring.cgColor]
    static let golds   = [UIColor.lemon.cgColor, UIColor.gold.cgColor]
    static let oranges = [UIColor.bloodOrange.cgColor, UIColor.tangerine.cgColor]
    static let reds    = [UIColor.tangerine.cgColor, UIColor.tomato.cgColor]
    static let pinks   = [UIColor.pink.cgColor, UIColor.lightPink.cgColor]
}
