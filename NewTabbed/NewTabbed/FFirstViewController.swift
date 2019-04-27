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
            tableData.append(newCatData as! String)
            subtitleData.append("\(amtData!)")
        }
    }
    catch let err
    {
        print(err.localizedDescription)
    }
}
class FFirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{
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
    @IBOutlet weak var incsum: UILabel!
    
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
    
    override func viewDidLoad()
    {
        retrieveData()
        incsum.text = "\(inc_sum)"
        expsum.text = "\(exp_sum)"
        totalsum.text = "\(inc_sum - exp_sum)"
        super.viewDidLoad()
    }
}
