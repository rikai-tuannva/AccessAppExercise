//
//  ViewController.swift
//  BaseProject
//
//  Created by TuanNVA on 04/07/2021.
//

import UIKit
import RxSwift
import RxCocoa
import MBProgressHUD

import UIKit
import RxSwift
import RxCocoa
import MBProgressHUD

class ViewController: UIViewController {
    
    enum NavigationBarStyle {
        case normal
        case clear
    }
    
    var viewModel: ViewModel?
    var navigator: Navigator?
    
    let disposeBag = DisposeBag()
    
    let isLoading = BehaviorRelay(value: false)
    
    let emptyDataSetButtonTap = PublishSubject<Void>()
    
    var isBarShadowHidden: Bool {
        return true
    }
    
    var navigationBarStyle: NavigationBarStyle {
        return .normal
    }
    
    var isNavigationHidden: Bool {
        return false
    }
    
    var rightBarButtonItems: [UIBarButtonItem]? {
        return nil
    }
    
    var leftBarButtonItems: [UIBarButtonItem]? {
        return nil
    }
    
    var barTitle: String {
        return ""
    }
    
    var barSubTitle: String {
        return ""
    }
    
    var barItemTintColor: UIColor? {
        return UIColor.accentColor
    }
    
    var barTintColor: UIColor? {
        return .accentColor
    }
    
    final lazy var btnNavigationBarBack: UIBarButtonItem = {
        return UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .done,
            target: self,
            action: #selector(self.backButtonTapped(sender:))
        )
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = isNavigationHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
        bindViewModel()
    }
    
    deinit {
        log.info("\(type(of: self)): Deinited")
    }
    
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        log.info("\(type(of: self)): Received Memory Warning")
    }
    
    func makeUI() {
        configureBarItem(title: barTitle, subTitle: barSubTitle)
        isLoading.subscribe(onNext: {[weak self] (loading) in
            guard let self = self else { return }
            if loading {
                let Indicator = MBProgressHUD.showAdded(to: self.view, animated: true)
                Indicator.label.text = "common_loading".localized()
                Indicator.isUserInteractionEnabled = false
                Indicator.show(animated: true)
            } else {
                MBProgressHUD.hide(for: self.view, animated: true)
            }
        }).disposed(by: disposeBag)
    }
    
    func setTitle(_ title: String){
        configureBarItem(title: title, subTitle: barSubTitle)
    }
    
    func bindViewModel() {
        
    }
}

// MARK: - Setup navigation
extension ViewController {
    func refreshNavigationTitle(title: String, subTitle: String) {
        configureBarTitle(title: title, subTitle: subTitle)
    }
    
    private final func configureBarItem(title: String, subTitle: String) {
        navigationItem.setHidesBackButton(true, animated: false)
        
        navigationController?.navigationBar.tintColor = barItemTintColor
        navigationItem.rightBarButtonItems = rightBarButtonItems
        navigationItem.leftBarButtonItems = leftBarButtonItems
        
        configureBarTitle(title: title, subTitle: subTitle)
    }
    
    private final func configureBarTitle(title: String, subTitle: String) {
        let label = UILabel()
        var titleAttribute: NSMutableAttributedString?
        
        if !title.isEmpty {
            let attributes = [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .heavy),
                NSAttributedString.Key.foregroundColor: barItemTintColor ?? .white
            ]
            
            titleAttribute = NSMutableAttributedString(
                string: title,
                attributes: attributes
            )
        }
        
        var subTitleAttribute: NSMutableAttributedString?
        if !subTitle.isEmpty {
            let font = UIFont.systemFont(ofSize: 14, weight: .heavy)
            
            let attributes = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: barItemTintColor ?? .white
            ]
            
            subTitleAttribute = NSMutableAttributedString(
                string: subTitle,
                attributes: attributes
            )
        }
        
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.textAlignment = .center
        
        //Muiltible title
        if let titleAttribute = titleAttribute, let subTitleAttribute = subTitleAttribute {
            let textAttribute = NSMutableAttributedString()
            textAttribute.append(titleAttribute)
            let breaklineAttribute = NSMutableAttributedString(string: "\n", attributes: nil)
            textAttribute.append(breaklineAttribute)
            textAttribute.append(subTitleAttribute)
            label.attributedText = textAttribute
            navigationItem.titleView = label
            return
        }
        //Title only
        if let titleAttribute = titleAttribute {
            label.attributedText = titleAttribute
            navigationItem.titleView = label
            return
        }
        //Sub title only
        if let subTitleAttribute = subTitleAttribute {
            label.attributedText = subTitleAttribute
            navigationItem.titleView = label
        }
    }
    
    //Handle back button
    @objc func backButtonTapped(sender: UIBarButtonItem) {
        if ((self.navigationController?.presentingViewController) != nil){
            self.navigationController?.dismiss(animated: true, completion: nil)
        } else{
            navigationController?.popViewController(animated: true)
        }
    }
}
