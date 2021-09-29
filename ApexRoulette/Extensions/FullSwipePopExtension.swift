//
//  FullSwipePopExtension.swift
//  ApexRoulette
//
// Created by Noah Boyers on 8/26/21.
//

import SwiftUI

extension View {
    // Creating a property for View to access easily
    func fullSwipePop<Content: View>(show: Binding<Bool>,content: @escaping ()->
                                        Content)-> some View {
        return FullSwipePopHelper(show: show, mainContent: self, content: content())
    }
}


// Helper Function to build view
private struct FullSwipePopHelper<MainContent: View, Content: View>: View {
    
    //Where our main content will be our main view
    // since we are moving our main left when the overlay shows
    var mainContent: MainContent
    var content: Content
    @Binding var show: Bool
    
    init(show: Binding<Bool>, mainContent: MainContent, content: Content) {
        self._show = show
        self.content = content
        self.mainContent = mainContent
        
    }
    
    @GestureState var gestureOffset: CGFloat = 0
    @State var offset: CGFloat = 0
    
    var body: some View {
        
        GeometryReader { proxy in
            
            mainContent
                .offset(x: show && offset >= 0 ? getOffset(size: proxy.size.width)
                            : 0)
                .overlay(
                    ZStack {
                        
                        if show {
                            content
                                
                                
                                .offset(x: offset > 0 ? offset : 0)
                                .gesture(DragGesture()
                                            .updating($gestureOffset,
                                                      body: { value,out,_ in
                                                        
                                                        out = value.translation.width
                                                        
                                                      })
                                            .onEnded({ value in
                                                withAnimation(.linear.speed(2)) {
                                                    // Close if pass
                                                    offset = 0
                                                    
                                                    let translation = value.translation.width
                                                    let maxtranslation = proxy.size.width / 2.5
                                                    
                                                    if translation > maxtranslation {
                                                        show = false
                                                    }
                                                }
                                            }))
                                .transition(.move(edge: .trailing))
                            
                        }
                    }
                )
                //Updating offset only on vaild touch
                .onChange(of: gestureOffset) { newValue in
                    offset = gestureOffset
                }
        }
    }
    func getOffset(size: CGFloat)->CGFloat {
        
        let progress = offset / size
        let start: CGFloat = -80
        let progressWidth = (progress * 90) <= 90 ? (progress * 90) : 90
        let minOffset = (start + progressWidth) < 0 ? (start + progressWidth) : 0
        
        return minOffset
    }
}

