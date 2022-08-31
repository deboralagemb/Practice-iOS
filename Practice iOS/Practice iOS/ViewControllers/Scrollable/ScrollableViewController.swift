//
//  ScrollableViewController.swift
//  Practice iOS
//
//  Created by Débora Lage on 30/08/22.
//

import UIKit

class ScrollableViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet private var collectionView: UICollectionView!
    @IBOutlet private var tableView: UITableView!
    
    // MARK: - Properties
    private var dataSource: [ScrollableModel] = []
    private var tableCellIdentifier: String = "tableCellIdentifier"
    private var collectionCellIdentifier: String = "collectionCellIdentifier"

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createModel()
        configureTableView()
        configureCollectionView()
    }
    
    // MARK: - Private
    private func configureTableView() {
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(nib, forCellReuseIdentifier: tableCellIdentifier)
    }
    
    private func configureCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(nib, forCellWithReuseIdentifier: collectionCellIdentifier)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension ScrollableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource[section].sectionContent.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        dataSource[section].sectionName
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
        let row = indexPath.row
        let section = indexPath.section
        cell.configure(with: dataSource[section].sectionContent[row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ScrollableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCellIdentifier, for: indexPath) as? CollectionViewCell else { return UICollectionViewCell() }
        let row = indexPath.row
        cell.configure(with: dataSource[row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = indexPath.row
        tableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: true)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}

// MARK: - Model
extension ScrollableViewController {
    func createModel() {
        let sectionContent1 = SectionContentModel(content: "Boneless chicken breasts")
        let sectionContent2 = SectionContentModel(content: "Churrasco steak")
        let sectionContent3 = SectionContentModel(content: "Grillmaster trio")
        let sectionContent4 = SectionContentModel(content: "Whole chicken")
        let sectionContent5 = SectionContentModel(content: "Shrimp slaw")
        let content = [sectionContent1, sectionContent2, sectionContent3, sectionContent4, sectionContent5]
        
        dataSource.append(ScrollableModel(sectionName: "Platters", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Sandwiches & wraps", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Family meals", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Salads & soup", sectionContent: content))
        dataSource.append( ScrollableModel(sectionName: "Kids meals", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Drinks", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Side dishes", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Desserts", sectionContent: content))
        dataSource.append(ScrollableModel(sectionName: "Party bundles", sectionContent: content))
    }
}
