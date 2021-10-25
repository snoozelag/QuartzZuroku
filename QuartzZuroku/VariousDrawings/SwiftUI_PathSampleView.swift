//
//  SwiftUI_PathSampleView.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit
import SwiftUI

struct SwiftUI_PathSampleView: View {

    var body: some View {
        VStack(alignment: .center) {
            RectanglesView1()
            RectanglesView2()
        }.navigationBarTitle("Drawing in SwiftUI (1)")
    }

    struct RectanglesView1: View {
        var body: some View {
            // 例(1)
            ZStack {
                Color(.lightGray)
                ZStack {
                    // 青い長方形（ライン）を描画
                    Path { path in
                        path.addRect(CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
                    }
                    .stroke(Color(.blue))
                    // 赤い長方形（塗りつぶし）を描画
                    Path { path in
                        path.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 100, height: 100)))
                    }
                    .fill(Color(.red))
                }.frame(width: 110, height: 110)
            }
        }
    }

    struct RectanglesView2: View {
        var body: some View {
            // 例(2)
            ZStack {
                Color(.lightGray)
                ZStack {
                    // 赤い長方形（塗りつぶし）を描画
                    Path { path in
                        path.addRect(CGRect(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 100, height: 100)))
                    }
                    .fill(Color(.red))
                    // 青い長方形（ライン）を描画
                    Path { path in
                        path.addRect(CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 100, height: 100)))
                    }
                    .stroke(Color(.blue))
                }.frame(width: 110, height: 110)
            }
        }
    }
}
