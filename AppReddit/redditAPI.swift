//
//  redditAPI.swift
//  AppReddit
//
//  Created by Mobile App on 22/09/17.
//  Copyright © 2017 nvjuanddl. All rights reserved.
//

import Foundation
import CoreData
import UIKit
import SystemConfiguration

struct defaultsKeys {
    static let keySaDB        = "keyRedditDB"
}

public struct Categoria {
    var nombreCategoria : String
    var App : [DetalleApp]
}

public struct DetalleApp {
    
    var nombreCategoria : String
    var nombreApp    : String
    var imagenApp    : String
    var detalleApp   : String
    var imagenHeader : String
    
    init(nombreCategoria : String, nombreApp  : String, imagenApp  : String, detalleApp : String , imagenHeader : String  ) {
        self.detalleApp = detalleApp
        self.nombreApp = nombreApp
        self.imagenApp = imagenApp
        self.nombreCategoria = nombreCategoria
        self.imagenHeader = imagenHeader
    }
}

struct Perro {
    var name : String
}

class redditAPI {
    
    var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    public var categoria = [Categoria]()
    public var dApp = [DetalleApp]()
    private var auxDApp = [DetalleApp]()
    var perro = [Perro]()
    
    @available(iOS 10.0, *)
    
    func DataReddit(){
        
        
        var auxInt = Int()
        let userdefaults = UserDefaults.standard
        
        if isInternetAvailable(){
            let sampleDataAddress = "https://www.reddit.com/reddits.json"
            let url = URL(string: sampleDataAddress)!
            let jsonData = try! Data(contentsOf: url)
            
            
            if let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) {
                if let jsonArray = json as? [String: Any] {
                    
                    var auxCategoria    : [String] = []
                    
                    let countAudienceTarget = Reddit(dict: jsonArray).data.children.dataChildren.audience_target.count
                    if userdefaults.object(forKey: defaultsKeys.keySaDB) != nil{
                        auxInt = (userdefaults.object(forKey: defaultsKeys.keySaDB) as! Int)
                    }
                    userdefaults.set(auxInt, forKey: defaultsKeys.keySaDB)
                    for j in 0...countAudienceTarget-1 {
                        auxCategoria.insert(Reddit(dict: jsonArray).data.children.dataChildren.audience_target[j], at: j)
                        dApp.insert(DetalleApp(nombreCategoria: auxCategoria[j],
                                               nombreApp: Reddit(dict: jsonArray).data.children.dataChildren.title[j],
                                               imagenApp: Reddit(dict: jsonArray).data.children.dataChildren.icon_img[j],
                                               detalleApp: Reddit(dict: jsonArray).data.children.dataChildren.description[j],
                                               imagenHeader: Reddit(dict: jsonArray).data.children.dataChildren.header_img[j]),
                                    at: j)
                        
                        
                        
                        if (auxInt != countAudienceTarget-1){
                            createData(nombreCategoria: auxCategoria[j], nombreApp: Reddit(dict: jsonArray).data.children.dataChildren.title[j], detalleApp: Reddit(dict: jsonArray).data.children.dataChildren.description[j], imagenApp: Reddit(dict: jsonArray).data.children.dataChildren.icon_img[j], imagenHeader: Reddit(dict: jsonArray).data.children.dataChildren.header_img[j], index: j)
                        }
                        
                    }
                    
                    
                    let categoria = uniq(source: auxCategoria)
                    
                    for i in 0...categoria.count-1 {
                        
                        for j in 0...dApp.count-1 {
                            if dApp[j].nombreCategoria == categoria[i]{
                                auxDApp.append(dApp[j])
                            }
                        }
                        self.categoria.append(Categoria(nombreCategoria: categoria[i], App: auxDApp))
                        auxDApp.removeAll()
                    }
                    
                }
            }
        }
        else{
            var nombreCategoria : [String] =  []
            var dAp       : [DetalleApp] =  []

            (nombreCategoria,dAp) = fetchData()
            
            if nombreCategoria.count != 0 {
                for i in 0...nombreCategoria.count-1 {
                    for j in 0...dAp.count-1 {
                        if dAp[j].nombreCategoria == nombreCategoria[i]{
                            auxDApp.append(dAp[j])
                        }
                    }
                    self.categoria.append(Categoria(nombreCategoria: nombreCategoria[i], App: auxDApp))
                    auxDApp.removeAll()
                }
            }
            
            
        }
    }
    
    func commonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Iterator.Element]
        where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
            var common: [T.Iterator.Element] = []
            
            for lhsItem in lhs {
                for rhsItem in rhs {
                    if lhsItem == rhsItem {
                        common.append(lhsItem)
                    }
                }
            }
            return common
    }
    
    func isInternetAvailable() -> Bool{
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
    func createData(nombreCategoria : String, nombreApp : String, detalleApp : String, imagenApp : String, imagenHeader : String, index : Int) {
        
        let cEntity : NSEntityDescription = NSEntityDescription.entity(forEntityName: "CategoriaEntity", in: self.appDelegate.coreDataStack.managedObjectContext)!
        let aEntity : NSEntityDescription = NSEntityDescription.entity(forEntityName: "AppEntity", in: self.appDelegate.coreDataStack.managedObjectContext)!
        let cat : CategoriaEntity = CategoriaEntity(entity: cEntity, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
        let app : AppEntity = AppEntity(entity: aEntity, insertInto: self.appDelegate.coreDataStack.managedObjectContext)
        let userdefaults = UserDefaults.standard
        userdefaults.set(index, forKey: defaultsKeys.keySaDB)
        cat.nombreCategoria = nombreCategoria
        app.detalleApp = detalleApp
        app.nombreApp = nombreApp
        app.imagenHeader = imagenHeader
        app.imagenApp = imagenApp
        cat.appEntity = app
        
        self.appDelegate.coreDataStack.saveContext()
    }
    
    func fetchData()-> (nombreCategoria : [String], dAp : [DetalleApp])  {
        var nombreCategoria : [String] =  []
        var dAp : [DetalleApp] =  []
        let fetchRequestCategoria: NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "CategoriaEntity")
        do {
            if let results = try self.appDelegate.coreDataStack.managedObjectContext.fetch(fetchRequestCategoria) as? [NSManagedObject] {
                if results.count != 0 {
                    for i in 0...results.count-1 {
                        let fetched: [CategoriaEntity]? = results as? [CategoriaEntity]
                        if fetched != nil {
                            print(fetched![i].appEntity.nombreApp)

                            nombreCategoria.append(fetched![i].nombreCategoria)
                            dAp.insert(DetalleApp(nombreCategoria: fetched![i].nombreCategoria, nombreApp: fetched![i].appEntity.nombreApp, imagenApp: fetched![i].appEntity.imagenApp, detalleApp: fetched![i].appEntity.detalleApp, imagenHeader: fetched![i].appEntity.imagenHeader), at: i)
                        }
                    }
                }
            }
        }
        catch {
            fatalError("There was an error fetching the items")
        }
        return (nombreCategoria, dAp)
    }
    
    
    
    func uniq<S : Sequence, T : Hashable>(source: S) -> [T] where S.Iterator.Element == T {
        var buffer = [T]()
        var added = Set<T>()
        for elem in source {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
    
}
