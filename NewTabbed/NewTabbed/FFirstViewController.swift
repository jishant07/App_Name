//
//  FFirstViewController.swift
//  NewTabbed
//
//  Created by Student on 10/04/19.
//  Copyright © 2019 ACEaceaceace. All rights reserved.
//

import UIKit
import CoreData

var tableData = [String]()
var subtitleData = [String]()

func getContext() -> NSManagedObjectContext
{
    let delegate = UIApplication.shared.delegate as! AppDelegate
    return delegate.persistentContainer.viewContext
}
func retrieveData()
{
    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Added_Data")
    do
    {
        let record = try getContext().fetch(fetchReq)
        tableData.removeAll()
        subtitleData.removeAll()
        for i in record as! [NSManagedObject]
        {
            let newCatData = (i.value(forKey:"category"))
            let amtData = (i.value(forKey: "amount"))
            tableData.insert(newCatData as! String, at: 0)
            subtitleData.insert("\(amtData!)", at: 0)
        }
    }
    catch let err
    {
        print(err.localizedDescription)
    }
}
func deleteData()
{
    let managedContext = getContext()
    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Added_Data")
    do
    {
        let record = try getContext().fetch(fetchReq)
        try managedContext.delete(record[0] as! NSManagedObject)
        do
        {
            try managedContext.save()
        }
        catch
        {
            print(error)
        }
    }
    catch
    {
        print(error)
    }
}
class FFirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
    @IBOutlet weak var add: UIButton!
   
    

    @IBOutlet weak var sample2: UIButton!
    @IBOutlet weak var mytab: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if(tableData.count < subtitleData.count)
        {
            return tableData.count
        }
        else
        {
            return subtitleData.count
        }
    }
    @IBOutlet weak var incsum: UILabel!
    @IBOutlet weak var sample: UIButton!
    @IBOutlet weak var totalsum: UILabel!
    @IBOutlet weak var expsum: UILabel!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "tableCell")
        cell.textLabel?.text = (((tableData[indexPath.row])) )
        cell.detailTextLabel?.text = (subtitleData[indexPath.row] )
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            tableData.remove(at: indexPath.row)
            subtitleData.remove(at: indexPath.row)
            deleteData()
            retrieveData()
            sum_amt()
        }
        mytab.reloadData()
    }
    override func viewDidAppear(_ animated: Bool)
    {
        mytab.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    func sum_amt()
    {
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Added_Data")
        do
        {
            let record = try getContext().fetch(fetchReq)
            var chk = 100
            exp_sum = 0
            inc_sum = 0
            for i in record as! [NSManagedObject]
            {
                chk = i.value(forKey: "inc_exp") as! Int
                if(chk == 0)
                {
                    exp_sum += i.value(forKey: "amount") as! Int
                }
                else if(chk == 1)
                {
                    inc_sum += i.value(forKey: "amount") as! Int
                }
            }
        }
        catch let err
        {
            print(err.localizedDescription)
        }
        incsum.text = "\(inc_sum)"
        expsum.text = "\(exp_sum)"
        totalsum.text = "\(inc_sum - exp_sum)"
    }
    override func viewDidLoad()
    {
        sum_amt()
        retrieveData()
        incsum.text = "\(inc_sum)"
        expsum.text = "\(exp_sum)"
        totalsum.text = "\(inc_sum - exp_sum)"
        super.viewDidLoad()
        add.applydesign()
        sample.applydesign1()
        sample2.applydesign1()
    }
}
extension UIButton{
    func applydesign(){
        self.backgroundColor = UIColor(hex: 0x63B221)
        self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 5, height: 5)
        
    }
    func applydesign1(){
        self.backgroundColor = UIColor(hex: 0x63B221)
        //self.layer.cornerRadius = self.frame.height / 2
        self.setTitleColor(UIColor.white, for: .normal)
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowRadius = 4
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
}
