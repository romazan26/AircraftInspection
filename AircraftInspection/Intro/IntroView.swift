//
//  IntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct IntroView: View {
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        TabView(selection: $pageIndex,
                content:  {
            ForEach(pages) { page in
                ZStack{
                    PageIntroView(page: page)
                    if page == pages.last {
                        Button {
                            isPresented = true
                            dismiss()
                        } label: {
                            HStack {
                                Spacer()
                                ZStack{
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.redForApp)
                                        Text("Begin")
                                        .foregroundStyle(.white)
                                }.frame(width: 144, height: 47)
                            }
                            
                            .padding()
                        }
                        .offset(y: 330)

                    }
                }
                
                .tag(page.tag)
            }
        })
        .fullScreenCover(isPresented: $isPresented, content: {
            TabViewBoot()
        })
        .ignoresSafeArea()
        .animation(.easeInOut, value: pageIndex)
        .tabViewStyle(.page)
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
}

#Preview {
    IntroView()
}
