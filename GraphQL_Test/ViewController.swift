//
//  ViewController.swift
//  GraphQL_Test
//
//  Created by Eyad Heikal on 4/11/20.
//  Copyright © 2020 Eyad Heikal. All rights reserved.
//

import UIKit
import Apollo

class ViewController: UIViewController {

    
//    var launches = [LaunchListQuery.Data.Launch.Launch]()
//    
//    enum ListSection: Int, CaseIterable {
//      case launches
//    }
    var dataArray: [String]! = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        NManager.shared.apollo.fetch(query: ShipsQuery()){ result in
            guard let data = try? result.get().data else {return}
            print(data.ships?.compactMap{$0?.name} as Any)
            self.dataArray = data.ships?.compactMap{$0?.name}
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        
//        print(ListSection.allCases.count)
//
//        NManager.shared.apollo.fetch(query: LaunchListQuery()) { result in
//          guard let data = try? result.get().data else { return }
//            print(data.launches.launches.compactMap{ $0?.id })
//            print(data.launches.launches.compactMap{ $0?.site })//.joined(separator: ", "))
//
//        }
//        NManager.shared.apollo.perform(mutation: LoginMutation())
        
//        NManager.shared.apollo.perform(mutation: MMutation(name: "Eyad")){ result in
//            guard let data = try? result.get().data else {return}
//            
//            print(data.deleteUsers?.returning.compactMap({ (e) in
//                return e.name!
//            }) as Any)
//        }

       
    }

}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Const.cellReuseIdentifier, for: indexPath)
        cell.textLabel!.text = dataArray[indexPath.row]
        return cell
    }
    
    
}
