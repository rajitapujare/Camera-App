//
//  AVCamManualPreviewView.swift
//  CameraApp1
//
//  Created by Rajita Pujare on 7/15/17.
//  Copyright © 2017 Rajita Pujare. All rights reserved.
//

import UIKit
import AVFoundation

@objc(AVCamManualPreviewView)
class AVCamManualPreviewView: UIView {
    
    override class var layerClass : AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    var session: AVCaptureSession? {
        get {
            let previewLayer = self.layer as! AVCaptureVideoPreviewLayer
            return previewLayer.session
        }
        
        set {
            let previewLayer = self.layer as! AVCaptureVideoPreviewLayer
            previewLayer.session = newValue
        }
    }

}
