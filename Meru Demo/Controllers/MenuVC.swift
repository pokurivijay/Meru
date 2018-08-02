//
//  MenuVC.swift
//  Meru Demo
//
//  Created by Vijay on 30/07/18.
//  Copyright © 2018 VJ. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userMobileNumberLabel: UILabel!
    @IBOutlet weak var userProfileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        userProfileImageView.roundedView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MenuVC: UITableViewDelegate{
    
    
}

extension MenuVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MENU.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellReuseIdentifier = "MenuTVCell"
        
        let cell:MenuTVCell = (tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as! MenuTVCell?)!
        
        cell.menuTitleLabel?.text = MENU[indexPath.row]
        cell.menuImageView?.image =  UIImage.init(named: MENU_IMAGES[indexPath.row])
        
        if (MENU.count == indexPath.row+1) {
            cell.versionStackView.isHidden = false
        }

        
        return cell
        
    }
    
    
}
