//
//  FullSwipePopExtension.swift
//  ApexRoulette
//
//  Created by Noah Boyers on 8/14/21.
//

import SwiftUI

extension View {
    // Creating a property for View to access easily
     func fullSwipePop<Content: View>(show: Binding<Bool>,content:
                                        @escaping ()->Content)-> some View {
        return FullSwipePopHelper(show: show, mainContent: self, content: content())
    }
}


// Helper Function to build view
private struct FullSwipePopHelper<MainContent: View,Content: View>: View {
    
    //Where our main content will be our main view
    // since we are moving our main left when the overlay shows
    
    var mainContent: MainContent
    var content: Content
    @Binding var show: Bool
    @GestureState var gestureOffset: CGFloat = 0
    @State var offset: CGFloat = 0
    
    init(show: Binding<Bool>,mainContent: MainContent, content: Content){
        self._show = show
        self.content = content
        self.mainContent = mainContent
    }
    
    var body: some View {
        
        GeometryReader { proxy in
            
            mainContent
                .offset(x: getOffset(size: proxy.size.width))
                .overlay(
                    ZStack {
                        if show {
                            content
                                
                                .offset(x:show && offset >= 0 ? getOffset(size: proxy.size.width) : 0)
                                // adding gesture
                                .gesture(DragGesture().updating($gestureOffset, body: { value, out,_ in
                                    
                                    out = value.translation.width
                                    
                                }).onEnded({value in
                                    //Close if pass
                                    withAnimation(.linear.speed(2)) {
                                        offset = 0
                                        let translation = value.translation.width
                                        let maxTranslation = proxy.size.width / 2.5
                                        
                                        if translation > maxTranslation {
                                            show = false
                                        }
                                        
                                    }
                                }))
                                .transition(.move(edge: .trailing))
                        }
                    }
                )
                // Updating offset
                // This will only update for an intentional swipe
                .onChange(of: gestureOffset) { newValue in
                    offset = gestureOffset
                    
                }
        }
    }
    func getOffset(size: CGFloat) -> CGFloat {
        let progress = offset / size
        
        // Moving slightly moving the view 80 (edge of the screen) towards the right side
        // and getting back to 0 based on the user's drag
        
        let start: CGFloat = -80
        let progressWidth: CGFloat = (progress * 90) <= 90 ? (progress * 90) : 90
        let mainOffset = (start + progressWidth) < 0 ? (start + progressWidth) : 0
        
        return mainOffset
    }
}


//struct FullSwipePopExtension_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
