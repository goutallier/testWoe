//
//  ForecastDataProvider.swift
//  Weather
//
//  Created by Geoffrey Goutallier on 26/10/2018.
//  Copyright © 2018 Geoffrey Goutallier. All rights reserved.
//

import UIKit

class ForecastDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        print("numberOfSections")
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRows")
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView?.dequeueReusableCell(
            withIdentifier: "ItemCell",
            for: IndexPath(row: 0, section: 0)) as! ItemCell
        
        cell.textLabel?.text = "Totototottotttoottoottotto"
        cell.backgroundColor = .red
        return cell
    }
}
