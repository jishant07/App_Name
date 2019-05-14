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
var food = 0
var social = 0
var self_dev = 0
var transportation = 0
var culture = 0
var house = 0
var apparrel = 0
var beauty = 0
var health = 0
var education = 0
var gift = 0
var others = 0
var allowance = 0
var salary = 0
var bonus = 0
func getContext() -> NSManagedObjectContext
{
    let delegate = UIApplication.shared.delegate as! AppDelegate
    return delegate.persistentContainer.viewContext
}
func retrive_exp_inc_cat_data()
{
    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Added_Data")
    food = 0
    social = 0
    self_dev = 0
    transportation = 0
    culture = 0
    house = 0
    apparrel = 0
    beauty = 0
    health = 0
    education = 0
    gift = 0
    others = 0
    allowance = 0
    salary = 0
    bonus = 0
    do
    {
        let record = try getContext().fetch(fetchReq)
        for i in record as! [NSManagedObject]
        {
            if(i.value(forKeyPath: "category") as! String == "Food")
            {
                food += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Social-Life")
            {
                social += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Self-Development")
            {
                self_dev += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Transportation")
            {
                transportation += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Culture")
            {
                culture += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Household")
            {
                house += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Apparel")
            {
                apparrel += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Beauty")
            {
                beauty += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Health")
            {
                health += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Education")
            {
                education += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Gift")
            {
                gift += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Others")
            {
                others += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Allowance")
            {
                allowance += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Salary")
            {
                salary += i.value(forKey: "amount") as! Int
            }
            if(i.value(forKeyPath: "category") as! String == "Bonus")
            {
                bonus += i.value(forKey: "amount") as! Int
            }
        }
    }
    catch let err
    {
        print(err.localizedDescription)
    }}
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
            let contentData = (i.value(forKey: "contents"))
            var xx = "\(contentData as! String)"
            xx = xx.trimmingCharacters(in: .whitespaces)
            if xx.count <= 15 {
                //do nothing
            }else{
                xx = String(xx[0]) + String(xx[1]) + String(xx[2]) + String(xx[3]) + String(xx[4]) + String(xx[5]) + String(xx[6]) + String(xx[7]) + String(xx[8]) + String(xx[9]) + String(xx[10]) + String(xx[11]) + String(xx[12]) + String(xx[13]) + ".."
            }
            let yy = "\(newCatData as! String)"
            tableData.insert(yy + " (" + xx + ")", at: 0)
            if(i.value(forKey: "account") as! String == "Cash")
            {
                subtitleData.insert("💰\(amtData!)", at: 0)
            }
            if(i.value(forKey: "account") as! String == "Account")
            {
                subtitleData.insert("🏧\(amtData!)", at: 0)
            }
            if(i.value(forKey: "account") as! String == "Card")
            {
                subtitleData.insert("💳\(amtData!)", at: 0)
            }
        }
    }
    catch let err
    {
        print(err.localizedDescription)
    }
}
func deleteData(index : Int)
{
    var chk = 0
    let managedContext = getContext()
    let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "Added_Data")
    do
    {
        let record = try getContext().fetch(fetchReq)
        for i in record as! [NSManagedObject]
        {
            print(chk,i)
            if(chk == index)
            {
                print("Should delete")
                managedContext.delete(i)
                do
                {
                    try managedContext.save()
                }
                catch
                {
                    print(error)
                }
            }
            chk+=1
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
        let gg = "\(String(describing: cell.textLabel?.text))"
        //print(String(gg[10]))
        
        if (String(gg[10]) == "B" && String(gg[11]) == "o") || (String(gg[10]) == "A" && String(gg[11]) == "l") || (String(gg[10]) == "S" && String(gg[11]) == "a") {
            cell.detailTextLabel?.text = ("+ " + subtitleData[indexPath.row] )
            cell.detailTextLabel?.textColor = UIColor(hex: 0x63B221)
        } else {
            cell.detailTextLabel?.text = ("- " + subtitleData[indexPath.row] )
            cell.detailTextLabel?.textColor = UIColor.red
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            tableData.remove(at: indexPath.row)
            subtitleData.remove(at: indexPath.row)
            deleteData(index:indexPath.row)
            retrieveData()
            sum_amt()
            retrive_exp_inc_cat_data()
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
        retrive_exp_inc_cat_data()
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
extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
extension Substring {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
}
