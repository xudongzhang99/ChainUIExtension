//
//  UITableView+DSL.swift
//  SwiftBaseLib
//
//  Created by 0314 on 2019/5/10.
//

import UIKit
public extension UITableView {
    @discardableResult
    func delegate(_ delegate: UITableViewDelegate) -> Self {
        self.delegate = delegate
        return self
    }
    @discardableResult
    func dataSource(_ dataSource: UITableViewDataSource) -> Self {
        self.dataSource = dataSource
        return self
    }
    @discardableResult
    func rowHeight(_ height: CGFloat) -> Self {
        self.rowHeight = height
        return self
    }
    @discardableResult
    func sectionFooterHeight(_ height: CGFloat) -> Self {
        self.sectionFooterHeight = height
        return self
    }
    @discardableResult
    func sectionHeaderHeight(_ height: CGFloat) -> Self {
        self.sectionHeaderHeight = height
        return self
    }
    @discardableResult
    func estimatedRowHeight(_ height: CGFloat) -> Self {
        self.estimatedRowHeight = height
        return self
    }
    @discardableResult
    func estimatedSectionHeaderHeight(_ height: CGFloat) -> Self {
        self.estimatedSectionHeaderHeight = height
        return self
    }
    @discardableResult
    func estimatedSectionFooterHeight(_ height: CGFloat) -> Self {
        self.estimatedSectionFooterHeight = height
        return self
    }
    @discardableResult
    func scroll(to indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition = .middle, animated: Bool = true) -> Self {
        if indexPath.section < 0 || indexPath.row < 0 || indexPath.section > self.numberOfSections || indexPath.row > self.numberOfRows (inSection: indexPath.section) {
            return self
        }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
        return self
    }
    @discardableResult
    func scroll(row: Int, section: Int = 0, at scrollPosition: UITableView.ScrollPosition = .middle, animated: Bool = true) -> Self {
        return scroll(to: IndexPath.init(row: row, section: section), at: scrollPosition, animated: animated)
    }
    @discardableResult
    func scrollToNearestSelectedRow(scrollPosition: UITableView.ScrollPosition = .middle, animated: Bool = true) -> Self {
        scrollToNearestSelectedRow(at: scrollPosition, animated: animated)
        return self
    }
    @discardableResult
    func separatorStyle(_ style: UITableViewCell.SeparatorStyle = .none) -> Self {
        self.separatorStyle = style
        return self
    }
    @discardableResult
    func tableHeaderView(_ head: UIView?) -> Self {
        self.tableHeaderView = head
        return self
    }
    @discardableResult
    func tableFooterView(_ foot: UIView?) -> Self {
        self.tableFooterView = foot
        return self
    }
}
