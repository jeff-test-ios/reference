//
//  SegmentedTabWidget.swift
//  CreateSegmentedTabWidget
//
//  Created by 邱志鴻 on 2018/11/27.
//  Copyright © 2018 邱志鴻. All rights reserved.
//

import UIKit

@IBDesignable
class SegmentedTabWidget: UIView {
    
    /// 左側的按鈕
    private lazy var leftButton: SHSelectedButton = {
        let button = self.getButton()
        button.tag = PageTab.left.rawValue
        button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    /// 中間的按鈕
    private lazy var middleButton: SHSelectedButton = {
        let button = self.getButton()
        button.tag = PageTab.middle.rawValue
        button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    /// 右側的按鈕
    private lazy var rightButton: SHSelectedButton = {
        let button = self.getButton()
        button.tag = PageTab.right.rawValue
        button.addTarget(self, action: #selector(self.onButtonAction(_:)), for: .touchUpInside)
        self.addSubview(button)
        return button
    }()
    
    /// 外框顏色(未選擇)
    @IBInspectable var borderColor: UIColor = UIColor.darkGray {
        didSet {
            self.leftButton.layer.borderColor = self.borderColor.cgColor
            self.middleButton.layer.borderColor = self.borderColor.cgColor
            self.rightButton.layer.borderColor = self.borderColor.cgColor
        }
    }
    /// 外框顏色(已選擇)
    @IBInspectable var borderSelectedColor: UIColor = UIColor.lightGray {
        didSet {
            self.leftButton.selectedBorderColor = self.borderSelectedColor
            self.middleButton.selectedBorderColor = self.borderSelectedColor
            self.rightButton.selectedBorderColor = self.borderSelectedColor
        }
    }
    /// 按鈕底色(未選擇)
    @IBInspectable var buttonColor: UIColor = UIColor.white {
        didSet {
            self.leftButton.backgroundColor = self.buttonColor
            self.middleButton.backgroundColor = self.buttonColor
            self.rightButton.backgroundColor = self.buttonColor
        }
    }
    /// 按鈕底色(已選擇)
    @IBInspectable var buttonSelectedColor: UIColor = UIColor.darkGray {
        didSet {
            self.leftButton.selectedBackgroundColor = self.buttonSelectedColor
            self.middleButton.selectedBackgroundColor = self.buttonSelectedColor
            self.rightButton.selectedBackgroundColor = self.buttonSelectedColor
        }
    }
    /// 文字顏色(未選擇)
    @IBInspectable var titleColor: UIColor = UIColor.darkGray {
        didSet {
            self.leftButton.setTitleColor(self.titleColor, for: .normal)
            self.middleButton.setTitleColor(self.titleColor, for: .normal)
            self.rightButton.setTitleColor(self.titleColor, for: .normal)
        }
    }
    /// 文字顏色(已選擇)
    @IBInspectable var titleHightlightColor: UIColor = UIColor.white {
        didSet {
            self.leftButton.setTitleColor(self.titleHightlightColor, for: .selected)
            self.middleButton.setTitleColor(self.titleHightlightColor, for: .selected)
            self.rightButton.setTitleColor(self.titleHightlightColor, for: .selected)
        }
    }
    /// 按鈕圓角
    @IBInspectable var cornerRadius: Float = 0 {
        didSet {
            self.leftButton.layer.cornerRadius = CGFloat(self.cornerRadius)
            self.middleButton.layer.cornerRadius = CGFloat(self.cornerRadius)
            self.rightButton.layer.cornerRadius = CGFloat(self.cornerRadius)
        }
    }
    
    /// 左側按鈕的文字內容
    @IBInspectable var leftTitle: String? {
        didSet {
            self.leftButton.setTitle(self.leftTitle, for: .normal)
        }
    }
    /// 中間按鈕的文字內容
    @IBInspectable var middleTitle: String? {
        didSet {
            self.middleButton.setTitle(self.middleTitle, for: .normal)
        }
    }
    /// 右側按鈕的文字內容
    @IBInspectable var rightTitle: String? {
        didSet {
            self.rightButton.setTitle(self.rightTitle, for: .normal)
        }
    }
    
    /// 選中的頁面
    enum PageTab: Int {
        /// 左側
        case left = 0
        /// 中間
        case middle = 1
        /// 右側
        case right = 2
        /// 全部選
        case none
    }
    /// 選中的頁面(0: 左; 1: 中; 2. 右)。
    @IBInspectable var selectedTab: Int = 0 {
        didSet {
            guard let tab = PageTab(rawValue: self.selectedTab) else { return }
            guard tab != self.currentTab else {
                return // selectedTab 與 currentTab 不一致才需要往下修改。
            }
            self.currentTab = tab
        }
    }
    /// 選中的頁面(私有參數)
    private var currentTab = PageTab.none {
        didSet {
            self.tab(self.currentTab)
            let tab = self.currentTab.rawValue
            guard tab != self.selectedTab else {
                return // selectedTab 與 currentTab 不一致才需要往下修改。
            }
            self.selectedTab = tab
        }
    }
    
    // MARK: life cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setUI()
    }
    
    // MARK: function
    /// 建立按鈕的方法
    private func getButton() -> SHSelectedButton {
        let button = SHSelectedButton(type: .custom)
        button.setTitleColor(self.titleColor, for: .normal)
        button.setTitleColor(self.titleHightlightColor, for: .selected)
        button.backgroundColor = self.buttonColor
        button.selectedBackgroundColor = self.buttonSelectedColor
        button.layer.borderWidth = 1.0
        button.layer.borderColor = self.borderColor.cgColor
        button.selectedBorderColor = self.borderSelectedColor
        return button
    }
    /// 設定按鈕位置的方法
    private func setUI() {
        
        /// SegmentedTabWidget 的寬。
        let frameW = self.frame.width
        /// SegmentedTabWidget 的高。
        let frameH = self.frame.height
        /// 統一間距。
        let space: CGFloat = 10.0
        /// 統一按鈕寬度。
        let buttonW = (frameW - space * 4) / 3
        /// 統一按鈕高度。
        let buttonH = frameH - space * 2
        
        // 設定左側按鈕的 frame 。
        self.leftButton.frame = CGRect(x: space, y: space, width: buttonW, height: buttonH)
        // 設定左側按鈕的 frame 。
        let middleX = self.leftButton.frame.maxX + space
        self.middleButton.frame = CGRect(x: middleX, y: space, width: buttonW, height: buttonH)
        // 設定左側按鈕的 frame 。
        let rightX = self.middleButton.frame.maxX + space
        self.rightButton.frame = CGRect(x: rightX, y: space, width: buttonW, height: buttonH)
        
    }
    /// 選定頁面時，改變樣式
    func tab(_ page: PageTab) {
        self.leftButton.isSelected = false
        self.middleButton.isSelected = false
        self.rightButton.isSelected = false
        switch page {
        case .left:
            self.leftButton.isSelected = true
        case .middle:
            self.middleButton.isSelected = true
        case .right:
            self.rightButton.isSelected = true
        case .none:
            break
        }
    }
    
    // MARK: selector
    @objc private func onButtonAction(_ sender: SHSelectedButton) {
        guard let tag = PageTab(rawValue: sender.tag) else { return }
        self.tab(tag)
    }

}

/**
 小喜自定義的按鈕。
 - remark: 主要是讓邊框跟背景顏色有 normal 跟 selected 的區別。
 */
class SHSelectedButton: UIButton {
    
    /// selected 狀態下的背景顏色。
    var selectedBackgroundColor: UIColor? {
        didSet {
            self.originalBackgroundColor = self.backgroundColor
        }
    }
    /// 非 highlighted 狀態下的背景顏色。
    var originalBackgroundColor: UIColor?
    
    /// selected 狀態下的邊框顏色。
    var selectedBorderColor: UIColor? {
        didSet {
            self.borderColor = self.layer.borderColor
        }
    }
    /// 非 highlighted 狀態下的邊框顏色。
    var borderColor: CGColor?
    
    /// 切換 selected 狀態時，要改變按鈕的樣式。
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                // 在 highlighted 時
                if let color = self.selectedBackgroundColor {
                    self.backgroundColor = color // 背景顏色
                }
                if let color = self.selectedBorderColor {
                    self.layer.borderColor = color.cgColor // 邊框顏色
                }
            } else {
                // 非 highlighted 時
                if let color = self.originalBackgroundColor {
                    self.backgroundColor = color // 背景顏色
                }
                if let color = self.borderColor {
                    self.layer.borderColor = color // 邊框顏色
                }
            }
        }
    }
    
}
