import UIKit

class ListView: UIView {
    // MARK: - Objects

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.white
        collectionView.register(GradientCell.self, forCellWithReuseIdentifier: StyleGuide.Cell.gradientCell)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    lazy var headerContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        view.addBlurEffect()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = StyleGuide.StaticText.headerLabel
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }

    private func configureCollectionView() {
        collectionView.contentInset = UIEdgeInsets(top: 44,left: 0,bottom: 0,right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 44,left: 0,bottom: 0,right: 0)
    }

    // MARK: - Setup Methods
    private func commonInit() {
        backgroundColor = .white
        setupViews()
        configureCollectionView()
    }

    private func setupViews() {
        setupCollectionView()
        setupHeaderView()
        setupHeaderLabel()
    }

    // MARK: - Constraints
    private func setupCollectionView() {
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    private func setupHeaderView() {
        addSubview(headerContainer)
        NSLayoutConstraint.activate([
            headerContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            headerContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerContainer.heightAnchor.constraint(equalToConstant: 44)
        ])
    }

    private func setupHeaderLabel() {
        headerContainer.addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.centerXAnchor.constraint(equalTo: headerContainer.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerContainer.centerYAnchor),
        ])
    }
}
