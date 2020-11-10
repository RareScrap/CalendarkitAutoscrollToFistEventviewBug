//
//  SegmentedHostViewController.swift
//  TestDayviewWithSegmentedControl
//
//  Created by RareScrap on 10.11.2020.
//

import UIKit

class SegmentedHostViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    private var contentViewContoller: UITabBarController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Убираем линию под navbar'ом
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "segueSegmentedHostContent") {
            contentViewContoller = segue.destination as! UITabBarController
        }
    }
    
    @IBAction func onSegmentChanged(_ sender: UISegmentedControl) {
        contentViewContoller?.selectedIndex = sender.selectedSegmentIndex
    }
}
