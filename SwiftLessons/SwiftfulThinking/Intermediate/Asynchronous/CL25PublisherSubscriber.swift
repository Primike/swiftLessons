//
//  CL25PublisherSubscriber.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 7/5/23.
//

import SwiftUI
import Combine

class CL25PSubscriberViewModel: ObservableObject {
    @Published var count: Int = 0
    var cancellables = Set<AnyCancellable>()
    
    @Published var textFieldText: String = ""
    @Published var textIsValid: Bool = false
    @Published var showButton: Bool = false
    
    init() {
        setUpTimer()
        addtextFieldSubscriber()
        addButtonSubscriber()
    }
    
    func addtextFieldSubscriber() {
        $textFieldText
//            .debounce(for: .seconds(4), scheduler: DispatchQueue.main)
            .map { text -> Bool in
                text.count > 3 ? true : false
            }
            .sink(receiveValue: { [weak self] isValid in
                self?.textIsValid = isValid
            })
            .store(in: &cancellables)
    }
    
    func setUpTimer(){
        Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self else { return }
                self.count += 1
                
                // after 10s no more updates, state will remain
                if self.count >= 10 {
                    for item in self.cancellables {
                        item.cancel()
                    }
                }
            }
            .store(in: &cancellables)
    }
    
    func addButtonSubscriber() {
        $textIsValid
            .combineLatest($count)
            .sink { [weak self] isValid, count in
                guard let self = self else { return }
                
                if isValid && count >= 10 {
                    self.showButton = true
                } else {
                    self.showButton = false
                }
            }
            .store(in: &cancellables)
    }
}

struct CL25PublisherSubscriber: View {
    @StateObject var viewModel = CL25PSubscriberViewModel()
    
    var body: some View {
        VStack {
            Text("\(viewModel.count)")
                .font(.largeTitle)
            
            Text(viewModel.textIsValid.description)
            
            TextField("Type something", text: $viewModel.textFieldText)
                .padding(.leading)
                .frame(height: 55)
                .font(.headline)
                .background(Color(UIColor.lightGray))
                .cornerRadius(10)
                .overlay(
                    ZStack {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .opacity(viewModel.textFieldText.count < 1 ? 0.0 : viewModel.textIsValid ? 0.0 : 1.0)
                        
                        Image(systemName: "checkmark")
                            .foregroundColor(.green)
                            .opacity(viewModel.textIsValid ? 1.0 : 0.0)
                    }
                        .font(.title)
                        .padding(.trailing)
    
                    , alignment: .trailing
                )
            
            Button {
                
            } label: {
                Text("Submit".uppercased())
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .opacity(viewModel.showButton ? 1.0 : 0.5)
            }
            .disabled(!viewModel.showButton)
        }
        .padding()
    }
}

struct CL25PublishersSubscribers_Previews: PreviewProvider {
    static var previews: some View {
        CL25PublisherSubscriber()
    }
}
