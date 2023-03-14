//
//  DetailStaffViewController.swift
//  GithubStaffs
//
//  Created by TuanNVA on 14/03/2023.
//

import UIKit
import RxSwift
import Kingfisher

class DetailStaffViewController: ViewController {
    @IBOutlet weak var txtNickName: PrimaryLabel!
    @IBOutlet weak var txtFullName: BoldLabel!
    @IBOutlet weak var imvAvatar: UIImageView!
    @IBOutlet weak var txtLocation: PrimaryLabel!
    @IBOutlet weak var txtBlog: PrimaryLabel!
    @IBOutlet weak var txtBio: PrimaryLabel!
    
    override var barTitle: String {
        "detail_title".localized()
    }
    
    override var leftBarButtonItems: [UIBarButtonItem]? {
        return [self.btnNavigationBarBack]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imvAvatar.layer.cornerRadius = 100
        imvAvatar.layer.masksToBounds = true
    }

    override func makeUI() {
        super.makeUI()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel as? DetailStaffViewModel else { return }
        
        let input = DetailStaffViewModel.Input()
        let output = viewModel.transform(input: input)
        
        viewModel.loading.asObservable().bind(to: isLoading).disposed(by: disposeBag)
        
        output.staff
            .asDriver()
            .drive(onNext: configViews)
            .disposed(by: disposeBag)
    }
    
    private func configViews(staff: Staff?) {
        guard let staff = staff else {return}
        imvAvatar.kf.setImage(with: URL(string: staff.avatarURL ?? ""))
        txtFullName.text = staff.name
        txtNickName.text = staff.login
        txtLocation.text = staff.location
        txtBlog.text = staff.blog
        txtBio.text = staff.bio
    }
}
