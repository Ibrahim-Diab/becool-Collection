//
//  ViewController.swift
//  be cool
//
//  Created by deepo on 4/7/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collect: UICollectionView!
    @IBOutlet weak var addbutton: UIBarButtonItem!

    var collectionviewlist = ["one😄 ","two 😀","three☹️","five🤓","six☹️","seven😼","eight😈","nine👻","ten👍🏾","eleven🖐","twelve🤘","thirteen💪"]
    @IBAction func addcell(_ sender: Any) {
        let text = "\("Cat")😺"
        collectionviewlist.append(text)
        let indexpath = IndexPath(item: collectionviewlist.count-1, section: 0)
        collect.insertItems(at: [indexpath])
    }
    
    @IBAction func deletecell(_ sender: Any) {
     if  let selected = collect.indexPathsForSelectedItems
        {
            let items = selected.map {$0.item}.sorted().reversed()
            for item in items
            {
collectionviewlist.remove(at: item)
            }
            collect.deleteItems(at: selected)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        let width = (view.frame.size.width-20)/3
        let layout = collect.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: width, height: width)
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing( editing , animated: animated)
        addbutton.isEnabled = !editing
        collect.allowsMultipleSelection = editing
        let indexpath = collect.indexPathsForVisibleItems
        for index in indexpath {
            let cell = collect.cellForItem(at: index) as! CollectionViewCell
            cell.isEditing = editing
            
        }
    }
    
}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionviewlist.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
       cell.titlename.text = collectionviewlist[indexPath.row]
        cell.isEditing = isEditing
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if !isEditing
        {
        performSegue(withIdentifier: "details", sender: indexPath)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if let dest = segue.destination as? ViewController2,
       let index = sender as? IndexPath
            {
                dest.selection = collectionviewlist[index.row]
            }
        }
    }
    

