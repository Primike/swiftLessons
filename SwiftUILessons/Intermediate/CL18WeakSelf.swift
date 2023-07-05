//
//  CL18WeakSelf.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/4/23.
//

import SwiftUI

struct CL18WeakSelf: View {
    @AppStorage("count") var count: Int?
    
    init() {
        count = 0
    }
    
    var body: some View {
        NavigationView {
            NavigationLink("Navigate") {
                CL18SecondScreen()
            }
            .navigationTitle("Screen 1")
        }
        .overlay(
            Text("\(count ?? 0)")
                .font(.largeTitle)
                .padding()
                .background(Color.green.cornerRadius(10))
            ,alignment: .topTrailing
        )
    }
}


struct CL18SecondScreen: View {
    @StateObject var viewModel = CL18WeakSelfViewModel()
    
    var body: some View {
        VStack {
            Text("Second View")
                .font(.largeTitle)
                .foregroundColor(.red)
            
            if let data = viewModel.data {
                Text(data)
            }
        }
    }
}

class CL18WeakSelfViewModel: ObservableObject {
    @Published var data: String? = nil
    
    init() {
        print("init")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount + 1, forKey: "count")
        getData()
    }
    
    deinit {
        print("deinit")
        let currentCount = UserDefaults.standard.integer(forKey: "count")
        UserDefaults.standard.set(currentCount - 1, forKey: "count")
    }
    
    func getData() {
        //Keeps instances alive by strong reference
//        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//            self.data = "New Data"
//            print("Done")
//        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {  [weak self] in
            guard let self = self else {
                print("Guard")
                return
            }
            
            self.data = "New Data"
            print("Done")
        }
    }
}

struct CL18WeakSelf_Previews: PreviewProvider {
    static var previews: some View {
        CL18WeakSelf()
    }
}
