//
//  FeedVC.swift
//  Blubber
//
//  Created by James Kang on 12/29/16.
//  Copyright © 2016 James Kang. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase

class FeedVC: UIViewController {

    var geoFire = GeoFire!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.defaultKeychainWrapper.remove(key: KEY_UID)
        print("JIMMY: ID Removed from KeyChain\(keychainResult)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }


}
