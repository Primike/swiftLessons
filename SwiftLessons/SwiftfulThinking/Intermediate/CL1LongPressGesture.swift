//
//  CL1LongPressGesture.swift
//  SwiftUILessons
//
//  Created by Prince Avecillas on 6/28/23.
//

import SwiftUI

struct CL1LongPressGesture: View {
    
    @State var isComplete: Bool = false
    @State var isSuccess: Bool = false
    
    var body: some View {
        
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack {
                Text("Click")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onLongPressGesture(minimumDuration: 1, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1)) {
                                isComplete = true
                            }
                        } else {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                if !isSuccess {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }
                
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(.black)
                    .cornerRadius(10)
                    .onTapGesture {
                        isComplete = false
                        isSuccess = false
                    }
            }
        }
//        Text(isComplete ? "Complete" : "Not Complete")
//            .padding()
//            .padding(.horizontal)
//            .background(isComplete ? .green : .gray)
//            .cornerRadius(10)
////            .onTapGesture {
////                isComplete.toggle()
////            }
//            .onLongPressGesture(minimumDuration: 1, maximumDistance: 30) {
//                isComplete.toggle()
//            }
    }
}

struct CL1LongPressGesture_Previews: PreviewProvider {
    static var previews: some View {
        CL1LongPressGesture()
    }
}
