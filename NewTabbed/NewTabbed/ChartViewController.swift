//
//  ChartViewController.swift
//  NewTabbed
//
//  Created by admin on 28/04/19.
//  Copyright © 2019 ACEaceaceace. All rights reserved.
//

import UIKit
import Charts
class ChartViewController: UIViewController {
    
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var incexpchart: UIButton!
    @IBOutlet weak var incomeschart: UIButton!
    @IBOutlet weak var expenseschart: UIButton!
    //inc vs exp
    
    @IBAction func incecpchartClicked(_ sender: Any) {
        init_graph_Inc_Exp()
    }
    
    @IBAction func incomeschartClicked(_ sender: Any)
    {
        //all income categories total
        inc_cat()
    }
    
    @IBAction func expenseschartClicked(_ sender: Any)
    {
        //all expenses categories total
        exp_cat()
    }
    func inc_cat()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        if(inc_sum != 0)
        {
            entries.append(PieChartDataEntry(value: Double(allowance),label: "Allowance"))
        }
        if(salary != 0)
        {
            entries.append(PieChartDataEntry(value: Double(salary),label: "Salary"))
        }
        if(bonus != 0)
        {
            entries.append(PieChartDataEntry(value: Double(bonus),label: "Bonus"))
        }
        
        let dataSet = PieChartDataSet(entries :entries, label: "")
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        dataSet.colors = [c1, c2, c3, c4, c5]
        
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
        
    }
    func init_graph_Inc_Exp()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        if(inc_sum != 0)
        {
            entries.append(PieChartDataEntry(value: Double(inc_sum),label: "Income"))
        }
        if(exp_sum != 0)
        {
            entries.append(PieChartDataEntry(value: Double(exp_sum),label: "Expense"))
        }
        
        let dataSet = PieChartDataSet(entries :entries, label: "")
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        dataSet.colors = [c1, c2, c3, c4, c5]
        
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
    }
    func exp_cat()
    {
        pieChart.chartDescription?.enabled = false
        pieChart.drawHoleEnabled = true
        pieChart.rotationAngle = 0
        pieChart.rotationEnabled = true
        pieChart.isUserInteractionEnabled = true
        //pieChart.legend.enabled = false
        var entries : [PieChartDataEntry] = Array()
        if(food != 0)
        {
            entries.append(PieChartDataEntry(value: Double(food),label: "Food"))
        }
        if(social != 0)
        {
            entries.append(PieChartDataEntry(value: Double(social),label: "Social"))
        }
        if(self_dev != 0)
        {
            entries.append(PieChartDataEntry(value: Double(self_dev),label: "Self-Developemt"))
        }
        if(transportation != 0)
        {
            entries.append(PieChartDataEntry(value: Double(transportation),label: "Transportation"))
        }
        if(culture != 0)
        {
            entries.append(PieChartDataEntry(value: Double(culture),label: "Culture"))
        }
        if(house != 0)
        {
            entries.append(PieChartDataEntry(value: Double(house),label: "Household"))
        }
        if(apparrel != 0)
        {
            entries.append(PieChartDataEntry(value: Double(apparrel),label: "Apparel"))
        }
        if(beauty != 0)
        {
            entries.append(PieChartDataEntry(value: Double(beauty),label: "Beauty"))
        }
        if(health != 0)
        {
            entries.append(PieChartDataEntry(value: Double(health),label: "Health"))
        }
        if(education != 0)
        {
            entries.append(PieChartDataEntry(value: Double(education),label: "Education"))
        }
        if(gift != 0)
        {
            entries.append(PieChartDataEntry(value: Double(gift),label: "Gift"))
        }
        if(others != 0)
        {
            entries.append(PieChartDataEntry(value: Double(others),label: "Others"))
        }
        
        //        /*if("\(entries.append(PieChartDataEntry(value: Double(others),label: "Others")))" != "()"){
        //            entries.append(PieChartDataEntry(value: Double(others),label: "Others"))
        //        }*/
        //        print(entries.append(PieChartDataEntry(value: Double(others),label: "Others")))
        let dataSet = PieChartDataSet(entries :entries, label: "")
        let c1 = NSUIColor(hex: 0x63B221)
        let c2 = NSUIColor(hex: 0x376114)
        let c3 = NSUIColor(hex: 0x35012C)
        let c4 = NSUIColor(hex: 0x290025)
        let c5 = NSUIColor(hex: 0x11001C)
        let c6 = NSUIColor(hex: 0x63B221)
        let c7 = NSUIColor(hex: 0x376114)
        let c8 = NSUIColor(hex: 0x35012C)
        let c9 = NSUIColor(hex: 0x290025)
        let c10 = NSUIColor(hex: 0x11001C)
        let c11 = NSUIColor(hex: 0x63B221)
        let c12 = NSUIColor(hex: 0x376114)
        
        
        dataSet.colors = [c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12]
        dataSet.drawValuesEnabled = false
        pieChart.data = PieChartData(dataSet: dataSet)
    }
    //income
    override func viewDidLoad()
    {
        super.viewDidLoad()
        incexpchart.applydesign1()
        incomeschart.applydesign1()
        expenseschart.applydesign1()
        init_graph_Inc_Exp()
        //pieChart.isHidden = true
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

