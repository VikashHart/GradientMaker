import UIKit

class DetailView: UIView {
    //MARK: - Objects
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: StyleGuide.Assets.backArrow)?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.tintColor = .white
        button.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        button.layer.cornerRadius = 20
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var gradientView: GradientView = {
        let view = GradientView()
        view.gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        view.gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // MARK: - Initializers
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    // MARK: - Setup Methods
    private func commonInit() {
        backgroundColor = .white
        setupViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }

    private func setupViews() {
        setupGradientView()
        setupBackButton()
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

    private func setupBackButton() {
        addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    //MARK: - Update UI
    func updateWith(colors: [CGColor]) {
        self.gradientView.gradientLayer?.colors = colors
    }
}
