//
//  ARKit Manager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 15/11/23.
//

import Foundation
import SwiftUI
import UIKit

struct ARViewForSwiftUI: UIViewRepresentable {


    func makeUIView(context: Context) -> UIView {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "arview")
        return vc.view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print("test")
    }
}
