//
//  ARKit Manager.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 15/11/23.
//

import Foundation
import SwiftUI
import UIKit
import ARKit
import RealityKit

struct ARViewForSwiftUI: UIViewRepresentable {


    func makeUIView(context: Context) -> UIView {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "arview")
        return vc.view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        print("test")
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    class Coordinator: NSObject, ARSessionDelegate {
        let westjetTeal: UIColor = UIColor( red: CGFloat(0/255.0), green: CGFloat(170/255.0), blue: CGFloat(165/255.0), alpha: CGFloat(1.0) )
        let coachingOverlay = ARCoachingOverlayView()
        var totalDistance: CGFloat = 0.0
        var nodes: [SphereNode] = []
        var positions: [SCNVector3] = []
        
        
        
    }

//    extension ARMeshGeometry { // See https://developer.apple.com/documentation/arkit/armeshgeometry/3516924-vertices
//        func vertex(at index: UInt32) -> SIMD3<Float> {
//            assert(vertices.format == MTLVertexFormat.float3, "Expected three floats (twelve bytes) per vertex.")
//            let vertexPointer = vertices.buffer.contents().advanced(by: vertices.offset + (vertices.stride * Int(index)))
//            let vertex = vertexPointer.assumingMemoryBound(to: SIMD3<Float>.self).pointee
//            return vertex
//        }
//    }
    
}


