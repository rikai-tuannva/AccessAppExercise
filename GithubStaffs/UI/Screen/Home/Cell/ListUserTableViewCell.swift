//
//  ListUserTableViewCell.swift
//  github_staff
//
//  Created by TuanNVA on 26/05/2022.
//

import UIKit
import Kingfisher

private struct Constrant {
    static let avatarCorner: CGFloat = 28.0
}

class ListUserTableViewCell: UITableViewCell {
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var staffView: UIView!
    @IBOutlet private weak var staffLabel: UILabel!
    @IBOutlet private weak var mainView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        staffView.isHidden = true
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        mainView.layer.shadowRadius = 4
        mainView.layer.shadowOpacity = 0.4
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        avatarImageView.layer.cornerRadius = Constrant.avatarCorner
        avatarImageView.layer.masksToBounds = true
        staffView.layer.cornerRadius = staffView.bounds.height / 2
        staffView.layer.masksToBounds = true
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        avatarImageView.image = nil
        super.prepareForReuse()
    }
    
    func configure(user: Staff) {
        nameLabel.text = user.login
        if let imageUrl = user.avatarURL {
            avatarImageView.kf.setImage(with: URL(string: imageUrl))
        } else {
            avatarImageView.image = nil
        }
        staffView.isHidden = !(user.siteAdmin ?? true)
    }
}
