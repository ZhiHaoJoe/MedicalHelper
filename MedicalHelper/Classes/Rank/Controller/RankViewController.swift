//
//  RankViewController.swift
//  MedicalHelper
//
//  Created by J on 16/8/11.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit
import SVProgressHUD
class RankViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    //模型数组
    var modelArray: [RandResultModel]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据
        SVProgressHUD.show()
        HttpTool.loadSearchInfo { (responseObject, error) in
            SVProgressHUD.dismiss()
            self.modelArray = responseObject
            self.tableView.reloadData()
        }
        
        tableView.dataSource = self;
        tableView.delegate = self;
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }
    
}

extension RankViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelArray?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = RankTableViewCell.cellWithTableView(tableView)
        
        cell.model = modelArray![indexPath.row]
        cell.index = indexPath.row
        return cell;
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 98
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = HospitalDoctorListViewController(controllerName: "HospitalDoctorListViewController")
        vc.model = modelArray![indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}