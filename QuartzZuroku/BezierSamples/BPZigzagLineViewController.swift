//
//  BPZigzagLineViewController.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit

class BPZigzagLineViewController: UIViewController {

    private var drawView = BPZigzagLineView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Zigzag Line"
        view.backgroundColor = .systemBackground

        drawView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(drawView)
        drawView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        drawView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        drawView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 11).isActive = true
        drawView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -11).isActive = true
    }
}

class BPZigzagLineView: UIView {

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
        // 連結された線を描く
        let path = UIBezierPath()
        UIColor.black.setStroke()
        path.lineWidth = 2

        let pathPoints = [
            CGPoint(x: bounds.maxX * (0/3), y: 100),
            CGPoint(x: bounds.maxX * (1/3), y: 10),
            CGPoint(x: bounds.maxX * (1/3), y: 100),
            CGPoint(x: bounds.maxX * (2/3), y: 10),
            CGPoint(x: bounds.maxX * (2/3), y: 100),
            CGPoint(x: bounds.maxX * (3/3), y: 10),
        ]
        path.addLines(between: pathPoints)
        path.stroke()
    }
}

extension UIBezierPath {

    /// CGContext#addLines(between:)と同じになる実装
    func addLines(between pathPoints: [CGPoint]) {
        guard !pathPoints.isEmpty else { return }
        move(to: pathPoints[0])
        for i in 1..<pathPoints.count {
            addLine(to: pathPoints[i])
        }
    }
}
