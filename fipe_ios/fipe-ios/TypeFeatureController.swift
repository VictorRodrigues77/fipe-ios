// 
//  TypeFeatureController.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import UIKit

class TypeFeatureController: BaseController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: TypeFeatureViewModel!
    var router: TypeFeatureRouter!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchTypes()
    }
    
    override func initView() {
        super.initView()
        
        initTableView()
        initNavigation()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.onSuccessFetch = { [weak self] () in
            self?.tableView.reloadData()
        }
    }
    
}

// MARK: - UITableViewDataSource
extension TypeFeatureController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.didSelectRowAt(at: indexPath.row) else { return }
        router.showBrands(model: model)
    }
}

// MARK: - UITableViewDataSource
extension TypeFeatureController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypeCell", for: indexPath)
        guard let type = viewModel.cellForRowAt(at: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = type.title.uppercased()
        return cell
    }
}

// MARK: - Init
extension TypeFeatureController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func initNavigation() {
        title = "TIPO DE VEÍCULO"
        let backButton = UIBarButtonItem()
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
