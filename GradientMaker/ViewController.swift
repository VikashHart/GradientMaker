import UIKit

class ViewController: UIViewController {

    let listView = ListView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
    }

    private func configureVC() {
        setupView()
        listView.collectionView.delegate = self
        listView.collectionView.dataSource = self
    }

    private func setupView() {
        listView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listView)
        NSLayoutConstraint.activate([
            listView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            listView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            listView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            listView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let cell = self.listView.collectionView.cellForItem(at: indexPath) as! GradientCell
        guard let colors = cell.colors else { return }

        let detailVC = DetailViewController(colors: colors)
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return StyleGuide.GradientColor.colorSet.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = listView.collectionView.dequeueReusableCell(withReuseIdentifier: StyleGuide.Cell.gradientCell, for: indexPath) as? GradientCell else { return UICollectionViewCell() }
        let colors = StyleGuide.GradientColor.colorSet[indexPath.row]
        cell.updateWith(colors: colors)
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let width = (screenWidth - (StyleGuide.FlowLayout.cellSpacing * StyleGuide.FlowLayout.numberOfSpaces)) / StyleGuide.FlowLayout.numberOfCells
        let height = width

        return CGSize(width: width , height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: StyleGuide.FlowLayout.cellSpacing, left: StyleGuide.FlowLayout.cellSpacing, bottom: StyleGuide.FlowLayout.cellSpacing, right: StyleGuide.FlowLayout.cellSpacing)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return StyleGuide.FlowLayout.cellSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return StyleGuide.FlowLayout.cellSpacing
    }
}
