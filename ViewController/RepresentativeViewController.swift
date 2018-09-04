//
//  RepresentativeViewController.swift
//  Representatives
//
//  Created by Levi Linchenko on 03/09/2018.
//  Copyright © 2018 Levi Linchenko. All rights reserved.
//

import UIKit

class RepresentativeViewController: UIViewController {
    
    
    @IBOutlet weak var nameOutlet: UILabel!
    @IBOutlet weak var stateOutlet: UILabel!
    @IBOutlet weak var partyOutlet: UILabel!
    @IBOutlet weak var districtOutlet: UILabel!
    @IBOutlet weak var officeOutlet: UILabel!
    
    @IBOutlet weak var phoneOutlet: UILabel!
    @IBOutlet weak var linkOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    var representative: Representative?


    func updateViews(){
        nameOutlet.text = representative?.name
        stateOutlet.text = representative?.state
        partyOutlet.text = representative?.party
        districtOutlet.text = representative?.district
        officeOutlet.text = representative?.office
        phoneOutlet.text = representative?.phone
        linkOutlet.text = representative?.link
    }

}
