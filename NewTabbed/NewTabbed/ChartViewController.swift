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
    
    @IBAction func incomeschartClicked(_ sender: Any) {
        //all income categories total
    }
    
    @IBAction func expenseschartClicked(_ sender: Any) {
        //all expenses categories total
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
        entries.append(PieChartDataEntry(value: Double(inc_sum),label: "Income"))
        entries.append(PieChartDataEntry(value: Double(exp_sum),label: "Expense"))
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
    //income
    override func viewDidLoad()
    {
        super.viewDidLoad()
        incexpchart.applydesign1()
        incomeschart.applydesign1()
        expenseschart.applydesign1()
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
