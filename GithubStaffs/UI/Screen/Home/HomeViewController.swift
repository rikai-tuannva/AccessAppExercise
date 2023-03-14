//
//  HomeViewController.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import UIKit
import RxCocoa

class HomeViewController: ViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override var barTitle: String {
        "home_title".localized()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func makeUI() {
        super.makeUI()
        
        self.tableView.separatorStyle = .singleLine
        self.tableView.register(nibWithCellClass: ListUserTableViewCell.self)
        self.tableView.clipsToBounds = true
        self.tableView.separatorStyle = .none
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel as? HomeViewModel else { return }
        
        let input = HomeViewModel.Input(itemClicked: tableView.rx.itemSelected.asDriver())
        let output = viewModel.transform(input: input)
        
        viewModel.loading.asObservable().bind(to: isLoading).disposed(by: disposeBag)
        
        output.items
            .asDriver(onErrorJustReturn: [])
            .drive(tableView.rx.items(cellIdentifier: ListUserTableViewCell.className,
                                           cellType: ListUserTableViewCell.self)){[weak self] row, element, cell in
                self?.setupTableViewCell(row: row, element: element, cell: cell)
            }.disposed(by: disposeBag)
    }
    private func setupTableViewCell(row: Int,
                                     element: Staff,
                                     cell: ListUserTableViewCell){
        
        cell.configure(user: element)
     }
}
