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
var contentData = [String]()
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
            //let date = (i.value(forKey: "date"))
            let contents = (i.value(forKey: "contents"))
            tableData.append(newCatData as! String)
            subtitleData.append("\(amtData!)")
            contentData.append(contents as! String)
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
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var mytab: UITableView!
    @IBOutlet weak var incsum: UILabel!
    @IBOutlet weak var totalsum: UILabel!
    @IBOutlet weak var expsum: UILabel!
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FFirstViewControllerTableViewCell
        cell.categoryLabel.text! = tableData[indexPath.row]
        cell.amountLabel.text! = subtitleData[indexPath.row]
        cell.contentLabel.text! = contentData[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            tableData.remove(at: indexPath.row)
            subtitleData.remove(at: indexPath.row)
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
            print("Expense Sum is :" ,exp_sum)
            print("Income Sum is : " ,inc_sum)
        }
        catch let err
        {
            print(err.localizedDescription)
        }
    }
    override func viewDidLoad()
    {
        sum_amt()
        retrieveData()
        print(contentData)
        incsum.text = "\(inc_sum)"
        expsum.text = "\(exp_sum)"
        totalsum.text = "\(inc_sum - exp_sum)"
        super.viewDidLoad()
    }
}
