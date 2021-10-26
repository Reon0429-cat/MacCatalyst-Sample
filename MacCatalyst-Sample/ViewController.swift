//
//  ViewController.swift
//  MacCatalyst-Sample
//
//  Created by 大西玲音 on 2021/10/27.
//

import UIKit
import Firebase


class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var countButton: UIButton!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = String(count)
    }

    @IBAction func countButtonDidTapped(_ sender: Any) {
        count += 1
        label.text = String(count)
    }
    
}

