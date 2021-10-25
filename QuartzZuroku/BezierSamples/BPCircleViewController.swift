//
//  BPCircleViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class BPCircleViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = BPCircleView()
    private let fillDrawView = BPFillCircleView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Circle"
        view.backgroundColor = .systemBackground

        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
        stackView.axis = .vertical
        stackView.spacing = 10

        drawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(drawView)
        drawView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        fillDrawView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fillDrawView)
        fillDrawView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

class BPCircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isOpaque = false
        backgroundColor = .lightGray
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        UIColor.black.setStroke()
        path.lineWidth = 2
        // 円（ライン）
        let arcPath = UIBezierPath(ovalIn: CGRect(x: 30, y: 30, width: 60, height: 60))
        path.append(arcPath)
        path.stroke()

        let arcPath2 = UIBezierPath(ovalIn: CGRect(x: 130, y: 30, width: 60, height: 60))
        path.append(arcPath2)
        path.stroke()
    }
}

class BPFillCircleView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        isOpaque = false
        backgroundColor = .lightGray
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        isOpaque = false
        backgroundColor = .lightGray
    }

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: CGRect(x: 30, y: 30, width: 60, height: 60))
        UIColor.blue.setFill()
        // 円（塗りつぶし）
        path.fill()
        // 同じ結果となるコンビニエンスメソッド
        let path2 = UIBezierPath(ovalIn: CGRect(x: 130, y: 30, width: 60, height: 60))
        path2.fill()
    }
}
