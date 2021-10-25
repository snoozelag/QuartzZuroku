//
//  BPArcViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class BPArcViewController: UIViewController {

    private let stackView = UIStackView()
    private let drawView = BPArcView()
    private let oneStrokeArcView = BPOneStrokeArcView()
    private let fillArcView = BPFillArcView()
    private let oneFillArcView = BPOneFillArcView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Arc"
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

        oneStrokeArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(oneStrokeArcView)
        oneStrokeArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        fillArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(fillArcView)
        fillArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true

        oneFillArcView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(oneFillArcView)
        oneFillArcView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
}

class BPArcView: UIView {

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
        let center = CGPoint(x: 45, y: 45)
        let path = UIBezierPath()
        // 右下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 0, endAngle: .pi / 2, clockwise: true)
        path.stroke()
        path.removeAllPoints()
        // 左下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: false)
        path.stroke()
    }
}

class BPOneStrokeArcView: UIView {

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
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 0, endAngle: .pi/2, clockwise: true)
        // 左下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: false)
        path.stroke()
    }
}

class BPFillArcView: UIView {

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
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 0, endAngle: .pi/2, clockwise: true)
        path.fill()
        path.removeAllPoints()
        // 左下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: false)
        path.fill()
    }
}

class BPOneFillArcView: UIView {

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
        let center = CGPoint(x: 45, y: 45)
        // 右下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 0, endAngle: .pi/2, clockwise: true)
        // 左下の円弧
        path.addArc(withCenter: center, radius: 30, startAngle: 3 * .pi / 2, endAngle: .pi, clockwise: false)
        path.fill()
    }
}
