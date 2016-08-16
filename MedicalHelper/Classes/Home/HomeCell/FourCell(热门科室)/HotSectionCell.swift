//
//  HotSectionCell.swift
//  MedicalHelper
//
//  Created by J on 16/8/15.
//  Copyright © 2016年 J. All rights reserved.
//

import UIKit

let HotSectionCollectionCellIdentifier = "HotSectionCollectionCell"
class HotSectionCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpCollectionView()
        
        loadData()
    }
    
    //设置collectionview
    private func setUpCollectionView(){
        collectionView.dataSource = self
        collectionView.registerNib(UINib(nibName: HotSectionCollectionCellIdentifier, bundle: nil), forCellWithReuseIdentifier: HotSectionCollectionCellIdentifier)
        collectionView.collectionViewLayout = HotSectionCollectionCellLayout()
        collectionView.backgroundColor = UIColor.colorWithHexString("#d6d6d6")
    }
    
    private func loadData(){
        
        for dictionary in dictionaryArray{
            
            let model = HotSectionCollectionCellModel(dictionary: dictionary as! [String : String])
            
            dataSourceArray.addObject(model)
        }
        
        collectionView.reloadData()
    }
    
    //
    private lazy var dictionaryArray: NSMutableArray = {
        let tmpArray = NSMutableArray(array: [
            ["title" : "内科","photoName" :"Depart11"],
            ["title" : "外科","photoName" :"Depart12"],
            ["title" : "骨外科","photoName" :"Depart13"],
            ["title" : "肿瘤科","photoName" :"Depart14"],
            ["title" : "中医学","photoName" :"Depart15"],
            ["title" : "妇产科","photoName" :"Depart16"]
            ])
        
        
        return tmpArray
    }()
    private lazy var dataSourceArray: NSMutableArray = NSMutableArray()
}

extension HotSectionCell: UICollectionViewDataSource{
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(HotSectionCollectionCellIdentifier, forIndexPath: indexPath) as! HotSectionCollectionCell
        cell.contentView.backgroundColor = UIColor.whiteColor()
        cell.model = dataSourceArray[indexPath.row] as? HotSectionCollectionCellModel
        return cell
    }
}

class HotSectionCollectionCellLayout: UICollectionViewFlowLayout{
    override init() {
        super.init()
        itemSize.width = (kScreenWidth - 1) * 0.5
        itemSize.height = 84
        minimumInteritemSpacing = 1
        minimumLineSpacing = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
