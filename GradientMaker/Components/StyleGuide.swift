import UIKit

enum StyleGuide {
    enum GradientColor {
        static let colorSet = CGColor.colorSet1
    }

    enum Assets {
        static let backArrow = "back_arrow"
    }

    enum StaticText {
        static let headerLabel = "Gradients"
    }

    enum Cell {
        static let gradientCell = "GradientCell"
    }

    enum FlowLayout {
        static let cellSpacing: CGFloat = 10
        static let numberOfCells: CGFloat = 2
        static let numberOfSpaces: CGFloat = 3
    }
}
