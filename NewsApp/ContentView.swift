//  ContentView.swift
//  NewsApp

import SwiftyJSON
import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    
    @ObservedObject var list = getData()
    
    var body: some View {
        NavigationView{
            List(list.datas){ i in
                HStack(spacing: 15){
                    VStack(alignment: .leading, spacing: 15){
                        Text(i.title).fontWeight(.heavy)
                        Text(i.description).lineLimit(2)
                        
                    }
                    
                    if i.urlToImage != ""{
                        WebImage(url: URL(string: i.urlToImage)!, options: .highPriority, context: nil).resizable().frame(width: 110, height: 135).cornerRadius(20 )
                    }
                    
                }.padding(.vertical, 15)
                 
            }.navigationBarTitle("Headlines")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
