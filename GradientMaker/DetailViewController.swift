import UIKit

class DetailViewController: UIViewController {

    let detailView = DetailView()
    let colors: [CGColor]?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    init(colors: [CGColor]) {
        self.colors = colors
        super.init(nibName: nil, bundle: nil)
    }

    private func configureVC() {
        view.backgroundColor = .white
        setupView()
        configureButton()
    }

    @objc private func backSelected() {
        dismiss(animated: true, completion: nil)
    }

    private func configureButton() {
        detailView.backButton.addTarget(self,
                                        action: #selector(backSelected),
                                        for: .touchUpInside)
    }

    private func setupView() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(detailView)
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        guard let gradientColors = self.colors else { return }
        detailView.updateWith(colors: gradientColors)
    }
}
