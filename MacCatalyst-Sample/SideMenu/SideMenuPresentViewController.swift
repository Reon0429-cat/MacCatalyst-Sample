//
//  SideMenuPresentViewController.swift
//  MacCatalyst-Sample
//
//  Created by 大西玲音 on 2021/10/29.
//

import UIKit
import SideMenu

class SideMenuPresentViewController: UIViewController {
    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    var leftSideMenuNavC: SideMenuNavigationController?
    var rightSideMenuNavC: SideMenuNavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        let leftSideMenuVC = UIStoryboard(name: "SideMenu", bundle: nil)
            .instantiateViewController(withIdentifier: "SideMenuViewController"
            ) as! SideMenuViewController
        let leftSideMenuNavC = SideMenuNavigationController(rootViewController: leftSideMenuVC)
        leftSideMenuNavC.settings = makeSettings()
        leftSideMenuNavC.menuWidth = 250
        SideMenuManager.default.leftMenuNavigationController = leftSideMenuNavC
        self.leftSideMenuNavC = leftSideMenuNavC
        
        let rightSideMenuVC = UIStoryboard(name: "SideMenu", bundle: nil)
            .instantiateViewController(withIdentifier: "SideMenuViewController"
            ) as! SideMenuViewController
        let rightSideMenuNavC = SideMenuNavigationController(rootViewController: rightSideMenuVC)
        rightSideMenuNavC.settings = makeSettings()
        leftSideMenuNavC.menuWidth = 250
        SideMenuManager.default.rightMenuNavigationController = rightSideMenuNavC
        self.rightSideMenuNavC = rightSideMenuNavC
        
        if let navigationController = self.navigationController {
            SideMenuManager.default.addPanGestureToPresent(toView: navigationController.navigationBar)
            SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: navigationController.view, forMenu: .left)
        }
        
    }
    
    @IBAction func leftButtonDidTapped(_ sender: Any) {
        guard let sideMenuNavC = leftSideMenuNavC else { return }
        present(sideMenuNavC, animated: true)
    }
    
    @IBAction func rightButtonDidTapped(_ sender: Any) {
        guard let sideMenuNavC = rightSideMenuNavC else { return }
        present(sideMenuNavC, animated: true)
    }
    
    private func makeSettings() -> SideMenuSettings {
        let presentationStyle: SideMenuPresentationStyle = .menuSlideIn // ここを修正
        presentationStyle.onTopShadowOpacity = 1.0
        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.statusBarEndAlpha = 0
        return settings
    }
    
}
