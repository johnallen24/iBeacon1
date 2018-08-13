//
//  ViewController.swift
//  BeaconTester
//
//  Created by John Allen on 7/20/18.
//  Copyright © 2018 jallen.studios. All rights reserved.
//


import UIKit
import CoreLocation
import CoreBluetooth

class ViewController: UIViewController {
    
    var centralManager: CBCentralManager!
    var peripheralManager: CBPeripheralManager!
    
    let button1: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("1", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 36)
        b.setTitleColor(UIColor.black, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let button2: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("2", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 36)
        b.setTitleColor(UIColor.black, for: .normal)
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let button3: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("3", for: .normal)
        b.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 36)
        b.setTitleColor(UIColor.black, for: .normal)
         b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        setupViews()
    }
    
    
    func setupViews() {
       
        
//        view.addSubview(stackView)
//        NSLayoutConstraint.activate([
//            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            stackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
//            //stackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1)
//            ])
//        view.addSubview(button1)
//        view.addSubview(button2)
//        view.addSubview(button3)
//
//        let safeAreaHeight = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
//        print(view.safeAreaInsets.top)
//        print(view.safeAreaInsets.bottom)
//        let buttonHeight = (safeAreaHeight - 128) * 1.0/3.0
//
//
//        NSLayoutConstraint.activate([
//            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button1.heightAnchor.constraint(equalToConstant: buttonHeight),
//           button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32)
//            ])
//
//        view.addConstraint(NSLayoutConstraint(item: button1, attribute: .width, relatedBy: .equal, toItem: button1, attribute: .height, multiplier: 1, constant: 0))
//
//        NSLayoutConstraint.activate([
//            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button2.heightAnchor.constraint(equalToConstant: buttonHeight),
//            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 32)
//            ])
//
//        view.addConstraint(NSLayoutConstraint(item: button2, attribute: .width, relatedBy: .equal, toItem: button2, attribute: .height, multiplier: 1, constant: 0))
//
//        NSLayoutConstraint.activate([
//            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button3.heightAnchor.constraint(equalToConstant: buttonHeight),
//            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 32)
//            ])
//
//        view.addConstraint(NSLayoutConstraint(item: button3, attribute: .width, relatedBy: .equal, toItem: button3, attribute: .height, multiplier: 1, constant: 0))
//
//
////        stackView.addArrangedSubview(button1)
////        stackView.addArrangedSubview(button2)
////        stackView.addArrangedSubview(button3)
////        stackView.setCustomSpacing(16, after: button1)
////        stackView.setCustomSpacing(16, after: button2)
//          button1.backgroundColor = UIColor.blue
//        button2.backgroundColor = UIColor.red
//        button3.backgroundColor = UIColor.green
////
////        stackView.distribution = .fillEqually
    }
    
    override func viewDidAppear(_ animated: Bool) {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        let safeAreaHeight = view.frame.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom
        print(view.safeAreaInsets.top)
        print(view.safeAreaInsets.bottom)
        let buttonHeight = (safeAreaHeight - 256) * 1.0/3.0
        
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.heightAnchor.constraint(equalToConstant: buttonHeight),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64)
            ])
        
        view.addConstraint(NSLayoutConstraint(item: button1, attribute: .width, relatedBy: .equal, toItem: button1, attribute: .height, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate([
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.heightAnchor.constraint(equalToConstant: buttonHeight),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 64)
            ])
        
        view.addConstraint(NSLayoutConstraint(item: button2, attribute: .width, relatedBy: .equal, toItem: button2, attribute: .height, multiplier: 1, constant: 0))
        
        NSLayoutConstraint.activate([
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.heightAnchor.constraint(equalToConstant: buttonHeight),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 64)
            ])
        
        view.addConstraint(NSLayoutConstraint(item: button3, attribute: .width, relatedBy: .equal, toItem: button3, attribute: .height, multiplier: 1, constant: 0))
        
        
        //        stackView.addArrangedSubview(button1)
        //        stackView.addArrangedSubview(button2)
        //        stackView.addArrangedSubview(button3)
        //        stackView.setCustomSpacing(16, after: button1)
        //        stackView.setCustomSpacing(16, after: button2)
        button1.backgroundColor = UIColor.colorWithHexString("e1156c")
        button2.backgroundColor = UIColor.colorWithHexString("e1156c")
        button3.backgroundColor = UIColor.colorWithHexString("e1156c")
        //UIColor.colorWithHexString(<#T##hexString: String##String#>)
        //
        //        stackView.distribution = .fillEqually
        print("john")
    }
    
    override func viewDidLayoutSubviews() {
      
        button1.layer.cornerRadius = button1.frame.height / 2
        button2.layer.cornerRadius = button2.frame.height / 2
        button3.layer.cornerRadius = button3.frame.height / 2
    }
    
}


extension ViewController: CBPeripheralManagerDelegate, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            // Scan for peripherals if BLE is turned on
            print("dudo")
            central.scanForPeripherals(withServices: nil, options: nil)
            if let region = createBeaconRegion() {
                advertiseDevice(region: region)
            }
            else {
                print("Error")
            }
            
        }
        else {
            // Can have different conditions for all states if needed - print generic message for now
            print("Bluetooth switched off or not initialized")
        }
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            if let region = createBeaconRegion() {
                print("maryellen")
                advertiseDevice(region: region)
            }
            else {
                print("Error")
            }
        }
        else {
            print("bluetooth turned off")
        }
    }
    
    func createBeaconRegion() -> CLBeaconRegion? {
        let proximityUUID = UUID(uuidString:
            "BCA717D7-23C3-42BD-883A-22D4F44104CC")
        let major : CLBeaconMajorValue = 100
        let minor : CLBeaconMinorValue = 1
        let beaconID = "lobby"
        
        return CLBeaconRegion(proximityUUID: proximityUUID!, identifier: beaconID)
    }
    
    func advertiseDevice(region : CLBeaconRegion) {
        let peripheralData = region.peripheralData(withMeasuredPower: nil)
        
        //peripheral.delegate = self
        self.peripheralManager.startAdvertising(((peripheralData as NSDictionary) as! [String : Any]))
        print("natty")
    }
    
    
}

