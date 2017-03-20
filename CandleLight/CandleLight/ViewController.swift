//
//  ViewController.swift
//  CandleLight
//
//  Created by Jeroen de Bie on 19/03/2017.
//  Copyright © 2017 Jeroen de Bie. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var flameOnOff: Bool = false
    
    @IBOutlet weak var flameOnnOrOff: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func LightOnOffButton(_ sender: Any) {
        if flameOnOff {
            flameOnOff = false
            flameOnnOrOff.image = #imageLiteral(resourceName: "CandleOff")
            toggleFlame(on: flameOnOff)
        } else {
            flameOnOff = true
            flameOnnOrOff.image = #imageLiteral(resourceName: "CandleOn")
            toggleFlame(on: flameOnOff)
        }
    }
    
    func toggleFlame(on: Bool) {
        guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            }
        } else {
            print("Torch is not available")
        }
    }


}

