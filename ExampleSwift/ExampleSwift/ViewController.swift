//
//  ViewController.swift
//  ExampleSwift
//
//  Created by Jhennyfer Rodrigues de Oliveira on 29/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var triggerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Trigger button", for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(buttonAction), for:.touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(triggerButton)
        setButtonConstraints()
        // Do any additional setup after loading the view.
    }
    
    @objc func buttonAction() {

    }
    
    func setButtonConstraints() {
        NSLayoutConstraint.activate([
            triggerButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            triggerButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            triggerButton.widthAnchor.constraint(equalToConstant: 200) ,
            triggerButton.heightAnchor.constraint(equalToConstant:40)])
    }

}

