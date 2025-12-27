//
//  SC9Actors.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/8/23.
//

import SwiftUI

final class SC9DataManager: @unchecked Sendable {
    
    static let shared = SC9DataManager()
    private init() {}
    
    var data: [String] = []
    /// Uses qos the task that calls it enters with
    private let lock = DispatchQueue(label: "threadsafe")
    
    func getRandomData(completion: @escaping @Sendable (_ title: String?) -> ()) {
        lock.async {
            self.data.append(UUID().uuidString)
            print(Thread.current)
            completion(self.data.randomElement())
        }
    }
}

actor SC9ActorDataManager {
    
    static let shared = SC9ActorDataManager()
    private init() {}
    
    var data: [String] = []
    nonisolated let variable: String = "Variable"
    
    func getRandomData() -> String? {
        self.data.append(UUID().uuidString)
        print(Thread.current)
        
        return self.data.randomElement()
    }
    
    // doesnt need to be called with await.
    nonisolated func getSavedData() -> String {
        return "Non await data"
    }
}

struct SC9HomeView: View {
    
    let dataManager = SC9ActorDataManager.shared
    @State private var text: String = ""
    let timer = Timer.publish(every: 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onAppear {
            self.text = dataManager.getSavedData()
        }
        
        .onReceive(timer) { _ in
            Task {
                if let data = await dataManager.getRandomData() {
                    await MainActor.run(body: {
                        self.text = data
                    })
                }
            }
        }
    }
}

struct SC9BrowseView: View {
    
    let dataManager = SC9DataManager.shared
    @State private var text: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            Color.yellow.opacity(0.8).ignoresSafeArea()
            
            Text(text)
                .font(.headline)
        }
        .onReceive(timer) { _ in
            dataManager.getRandomData { title in
                if let data = title {
                    DispatchQueue.main.async {
                        self.text = data
                    }
                }
            }
        }
    }
}

struct SC9Actors: View {
    var body: some View {
        TabView {
            SC9HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            SC9BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "magnifyingglass")
                }
        }
    }
}

struct SC9Actors_Previews: PreviewProvider {
    static var previews: some View {
        SC9Actors()
    }
}
