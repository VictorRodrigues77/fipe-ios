//
//  ModelsFeatureController.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 15/07/22.
//

import UIKit

class ModelsFeatureController: BaseController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: ModelsFeatureViewModel!
    var router: ModelsFeatureRouter!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchModels()
    }
    
    override func initView() {
        super.initView()
        
        initTableView()
        initNavigation()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        viewModel.onShowLoading = { [weak self] () in
            self?.showLoading()
        }
        
        viewModel.onHideLoading = { [weak self] () in
            self?.hideLoading()
        }
        
        viewModel.onSuccessFetch = { [weak self] () in
            self?.tableView.reloadData()
        }
        
        viewModel.onFailureFetch = { [weak self] error in
            self?.showError(error.localizedDescription)
        }
    }
    
}

// MARK: - UITableViewDelegate
extension ModelsFeatureController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.didSelectRowAt(at: indexPath.row) else { return }
        router.showYears(model: model)
    }
}

// MARK: - UITableViewDataSource
extension ModelsFeatureController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ModelCell", for: indexPath)
        guard let brand = viewModel.cellForRowAt(at: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = brand.nome.uppercased()
        return cell
    }
}

// MARK: - Init
extension ModelsFeatureController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func initNavigation() {
        title = "MODELOS"
        let backButton = UIBarButtonItem()
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}
