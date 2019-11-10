//
//  TransformationVC.swift
//  Daxko_FitSection
//
//  Created by Anurag Kashyap on 08/11/19.
//  Copyright © 2019 Anurag Kashyap. All rights reserved.
//

import UIKit

let transformationStroryBoardName = "Transformation"
let transformationVC = "TransformationVC"

class TransformationVC: UIViewController {

    @IBOutlet weak var transformationTableView : UITableView!
    
    lazy var menuLauncher: SelectionMenuLauncher = {
        let launcher = SelectionMenuLauncher()
        return launcher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func addTransformationAction(_ sender: UIBarButtonItem) {
        
        let categories = ["Add Transformation"]
        menuLauncher.launch(dataArray: categories) { (indexValue) in
            if indexValue > -1 {
                if let vc = UIStoryboard.init(name: transformationStroryBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: addTransformationDetailsVC) as? AddTransformationDetailsVC{
                    DispatchQueue.main.async {
                        vc.screenTitleLabel.text = "Post Transformation"
                        vc.postTransformationButtonOutlet.isHidden = false
                    }
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
}

extension TransformationVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = transformationTableView.dequeueReusableCell(withIdentifier: "TransformationTableViewCell", for: indexPath) as! TransformationTableViewCell
        return cell
    }
}

extension TransformationVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = UIStoryboard.init(name: transformationStroryBoardName, bundle: Bundle.main).instantiateViewController(withIdentifier: addTransformationDetailsVC) as? AddTransformationDetailsVC{
            DispatchQueue.main.async {
                vc.screenTitleLabel.text = "Transformation Story"
                vc.postTransformationButtonOutlet.isHidden = true
            }
            self.present(vc, animated: true, completion: nil)
        }
    }
}

