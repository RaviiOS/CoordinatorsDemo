//
//  GalleryListViewController.swift
//  CoordinatorsDemo
//
//  Created by Ravi Kumar Yaganti on 21/04/21.
//

import UIKit

class GalleryListViewController: UIViewController, Coordinating {

    @IBOutlet weak var galleryListTableView: UITableView!
    var coordinator: Coordinator?
    var viewModel: GalleryViewModel! {
        didSet {
            DispatchQueue.main.async {
                self.galleryListTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Gallery List"
        viewModel = GalleryViewModel(galleryItems: GalleryItems.getDummyData())
        DispatchQueue.main.async {
            self.galleryListTableView.reloadData()
        }
    }
    
}

extension GalleryListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel == nil {
            return 0
        }
        return viewModel.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        let image = viewModel.getItemAt(indexPath.row)
        cell.textLabel?.text = image.title
        return cell
    }
}

extension GalleryListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.evenOccurred(with: GalleryModule.galleryDetails(galleryItem: viewModel.getItemAt(indexPath.row)))
    }
}
