//
//  GetData.swift
//  NewsApp
import SDWebImageSwiftUI
import SwiftyJSON
import Foundation

class getData: ObservableObject{
    @Published var datas = [dataType]()
    
    init(){
        let source = "https://newsapi.org/v2/top-headlines?country=us&apiKey=967d65530dd449ecb956ce65ba5ee608"
        
        let url = URL(string: source)!
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: url) {(data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            let json = try! JSON(data: data!)
            
            for i in json["articles"]{
                let title = i.1["title"].stringValue
                let description = i.1["description"].stringValue
                let url = i.1["url"].stringValue
                let urlToImage = i.1["urlToImage"].stringValue
                let id = i.1["publishedAt"].stringValue
                
                
                DispatchQueue.main.async {
                    self.datas.append(dataType(id: id, title: title, description: description, urlToImage: urlToImage, url: url))
                }
                
            }
        }.resume()
    }
}
