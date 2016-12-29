//
//  ViewController.swift
//  Blubber
//
//  Created by James Kang on 12/24/16.
//  Copyright © 2016 James Kang. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("JIMMY: Unable to Authenticate with Facebook")
            } else if result?.isCancelled == true {
                print("JIMMY: User Cancelled Facebook Authentification")
            } else {
                print ("JIMMY: Successfuklly authentificated with Facebook")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
    }

    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("JIMMY: Unable to Authenticate with Firebase - \(error)")
            } else {
                print("JIMMY: Successfully authenticated with Firebase")
            }
        })
    }
    
}

