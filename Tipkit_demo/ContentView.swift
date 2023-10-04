//
//  ContentView.swift
//  Tipkit_demo
//
//  Created by vignesh kumar c on 04/10/23.
//

import SwiftUI
import TipKit

struct ContentView: View {
    
    private var favTip = FavoriteTip()
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("some") {
                    VStack {
                        
                    }
                    .navigationTitle("something")
                    .onAppear(perform: {
//                        FavoriteTip.numnerOfTimeVisited.donate()
                    })
                    .toolbar(content: {
                        ToolbarItem(placement: .topBarTrailing) {
                            Button(action: {
                                FavoriteTip.showTip = true
                            }, label: {
                                Image(systemName: "star")
                            })
                            .popoverTip(favTip, arrowEdge: .top)
                        }
                    })
                }
            }
            .navigationTitle("Message")
            
        }
    }
}

#Preview {
    ContentView()
}

struct FavoriteTip: Tip {
    
    @Parameter
    static var showTip: Bool = false
    static var numnerOfTimeVisited: Event = Event(id: "dev.vignesh.tip.event.numberoftimesvisited")
    
    var title: Text {
        Text("Save the photo as favorite")
    }
 
    var message: Text? {
        Text("Your favorite photos will appear in the favorite folder.")
    }
 
    var asset: Image? {
        Image(systemName: "heart")
    }
//        var image: Image? {
//        Image(systemName: "heart")
//    }
    
    var options: [TipOption] {
        return [
            Tips.MaxDisplayCount(3)
        ]
    }
    
    var rules: [Rule] {
        return [
//            #Rule(FavoriteTip.$showTip) { $0 == true }
            #Rule(Self.numnerOfTimeVisited) { $0.donations.count > 3 }
        ]
    }
}
