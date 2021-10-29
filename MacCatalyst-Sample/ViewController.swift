//
//  ViewController.swift
//  MacCatalyst-Sample
//
//  Created by 大西玲音 on 2021/10/27.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseFirestore

extension UIViewController {
    
    var isMacCatalyst: Bool {
#if targetEnvironment(macCatalyst)
        return true
#else
        return false
#endif
    }
    
}

//// usage
//if isMacCatalyst {
//    // mac layout
//} else {
//    // iOS layout
//}

final class ViewController: UIViewController {
    
    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var countButton: UIButton!
    private var count = 0
    private let db = Firestore.firestore()
    private var listener: ListenerRegistration?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        attachFirestore()
        setupUI()
        
    }
    
    @IBAction private func countButtonDidTapped(_ sender: Any) {
        db.collection("users")
            .document("reon")
            .getDocument { snapshot, error in
                if let error = error {
                    print("DEBUG_PRINT: 失敗", error.localizedDescription)
                    return
                }
                print("DEBUG_PRINT: 成功", #function)
                let count = snapshot?.data()?["count"] as! Int
                self.label.text = String(count)
            }
    }
    
    private func setupUI() {
        db.collection("users")
            .document("reon")
            .getDocument { snapshot, error in
                if let error = error {
                    print("DEBUG_PRINT: Firestoreの取得に失敗", error.localizedDescription)
                    return
                }
                let count = snapshot?.data()?["count"] as! Int
                self.label.text = String(count)
            }
        self.view.backgroundColor = .white
        label.textColor = .black
    }
    
    private func attachFirestore() {
        listener = db.collection("users")
            .document("reon")
            .addSnapshotListener { snapshot, error in
                if let error = error {
                    print("DEBUG_PRINT: ", error.localizedDescription)
                    return
                }
                print("DEBUG_PRINT: 成功", #function)
                let count = snapshot?.data()?["count"] as! Int
                self.label.text = String(count)
            }
    }
    
}

