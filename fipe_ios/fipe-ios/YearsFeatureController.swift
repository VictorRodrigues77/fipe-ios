//
//  YearsFeatureController.swift
//  fipe-ios
//
//  Created by Victor Rodrigues on 17/07/22.
//

import UIKit

class YearsFeatureController: BaseController {
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: YearsFeatureViewModel!
    var router: YearsFeatureRouter!
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchYears()
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
extension YearsFeatureController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let model = viewModel.didSelectRowAt(at: indexPath.row) else { return }
        router.showInfo(model: model)
    }
}

// MARK: - UITableViewDataSource
extension YearsFeatureController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YearCell", for: indexPath)
        guard let brand = viewModel.cellForRowAt(at: indexPath.row) else { return UITableViewCell() }
        cell.textLabel?.text = brand.nome.uppercased()
        return cell
    }
}

// MARK: - Init
extension YearsFeatureController {
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func initNavigation() {
        title = "ANOS"
        let backButton = UIBarButtonItem()
        backButton.title = " "
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
}

