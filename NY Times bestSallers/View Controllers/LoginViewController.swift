//
//  LoginViewController.swift
//  NY Times bestSallers
//
//  Created by Anthony Awuzie on 8/3/19.
//  Copyright © 2019 Anthony Awuzie. All rights reserved.
//

import UIKit
import FirebaseUI


class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @IBAction func loginTapped(_ sender: UIButton) {
        let authUi = FUIAuth.defaultAuthUI()
        guard authUi != nil else {
            return
        }
        
        authUi?.delegate = self
        
        let providers: [FUIAuthProvider] = [
            FUIEmailAuth(),
            FUIPhoneAuth(authUI: FUIAuth.defaultAuthUI()!)
        ]
        authUi?.providers = providers
        let authViewController = authUi!.authViewController()
        present(authViewController, animated: true, completion: nil)
    }
    
}

extension LoginViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        guard error == nil else {
            return
        }
        if let uid = authDataResult?.user.uid {
            FireBaseManager.shared.setUserUSerUID(UID: uid)
        }
       
        performSegue(withIdentifier: "goHome", sender: self)
    }
    
}
