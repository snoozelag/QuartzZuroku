//
//  SwiftUI_ShapeSampleView.swift
//  QuartzZuroku
//
//  Created by teruto.yamasaki on 2021/10/17.
//

import UIKit
import SwiftUI

struct SwiftUI_ShapeSampleView: View {

    var body: some View {
        VStack(alignment: .center) {
            RectanglesView1()
            RectanglesView2()
        }.navigationBarTitle("Drawing in SwiftUI (2)")
    }

    struct RectanglesView1: View {
        var body: some View {
            // 例(1)
            ZStack {
                Color(.lightGray)
                ZStack {
                    // 青い長方形（ライン）を描画
                    RectView()
                        .stroke(Color(.blue))
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 0)
                    // 赤い長方形（塗りつぶし）を描画
                    RectView()
                        .fill(Color(.red))
                        .frame(width: 100, height: 100)
                        .offset(x: 10, y: 10)
                }
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
                    RectView()
                        .fill(Color(.red))
                        .frame(width: 100, height: 100)
                        .offset(x: 10, y: 10)
                    // 青い長方形（ライン）を描画
                    RectView()
                        .stroke(Color(.blue))
                        .frame(width: 100, height: 100)
                        .offset(x: 0, y: 0)
                }
            }
        }
    }

    struct RectView: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()
            path.addRect(rect)
            return path
        }
    }
}
