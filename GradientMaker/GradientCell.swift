import UIKit

class GradientCell: UICollectionViewCell {

    var colors: [CGColor]?

    //MARK: - Objects
    lazy var gradientView: GradientView = {
        let view = GradientView()
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    //MARK: - Set up methods
    private func commonInit() {
        setupViews()
        configureCell()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func configureCell() {
        backgroundColor = UIColor.clear

        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 5
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        self.layer.rasterizationScale = UIScreen.main.scale
    }

    private func setupViews() {
        setupGradientView()
    }

    //MARK: - Constraints
    private func setupGradientView() {
        addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    //MARK: - Update UI
    func updateWith(colors: [CGColor]) {
        self.colors = colors
        self.gradientView.gradientLayer?.colors = colors
    }
}
