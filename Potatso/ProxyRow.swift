//
//  ProxyRow.swift
//  Potatso
//
//  Created by LEI on 6/1/16.
//  Copyright © 2016 TouchingApp. All rights reserved.
//

import Foundation
import PotatsoModel
import Eureka
import Cartography

class ProxyRow: Row<Proxy, ProxyRowCell>, RowType {

    required init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}


class ProxyRowCell: Cell<Proxy>, CellType {

    let group = ConstraintGroup()

    required init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }

    override func setup() {
        super.setup()
        preservesSuperviewLayoutMargins = false
        layoutMargins = UIEdgeInsetsZero
        separatorInset = UIEdgeInsetsZero
        contentView.addSubview(titleLabel)
        contentView.addSubview(iconImageView)
    }

    override func update() {
        super.update()
        if let proxy = row.value {
            titleLabel.text = proxy.name
            iconImageView.hidden = false
            iconImageView.image = UIImage(named: "Shadowsocks")
        }else {
            titleLabel.text = "None".localized()
            iconImageView.hidden = true
        }
        if row.isDisabled {
            titleLabel.textColor = "5F5F5F".color
        }else {
            titleLabel.textColor = "000".color
        }
        constrain(titleLabel, iconImageView, contentView, replace: group) { titleLabel, iconImageView, contentView in
            iconImageView.leading == contentView.leading + 16
            iconImageView.width == 14
            iconImageView.height == 14
            iconImageView.centerY == contentView.centerY
            titleLabel.centerY == iconImageView.centerY
            titleLabel.leading == iconImageView.trailing + 10
            titleLabel.trailing == contentView.trailing - 16
            titleLabel.bottom == contentView.bottom - 16
        }
    }

    lazy var titleLabel: UILabel = {
        let v = UILabel()
        v.font = UIFont.systemFontOfSize(17)
        return v
    }()

    lazy var iconImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .ScaleAspectFill
        return v
    }()

}
