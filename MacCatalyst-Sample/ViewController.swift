//
//  ViewController.swift
//  MacCatalyst-Sample
//
//  Created by 大西玲音 on 2021/10/27.
//

import UIKit
import FirebaseDatabase

final class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var countButton: UIButton!
    private var count = 0
    private var databaseRef: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        label.text = String(count)
        label.textColor = .black
        
        databaseRef = Database.database().reference()
        databaseRef.observe(.childAdded) { snapshot in
            if let object = snapshot.value as? [String: AnyObject],
               let count = object["count"] as? Int {
                self.label.text = String(count)
            }
        }
        
    }
    
    @IBAction private func countButtonDidTapped(_ sender: Any) {
        guard let text = label.text,
              let count = Int(text) else { return }
        let increasedCount = count + 1
        let data = ["count": increasedCount]
        databaseRef.childByAutoId().setValue(data)
    }
    
}

