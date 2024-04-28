//
//  IntroView.swift
//  AircraftInspection
//
//  Created by Роман on 05.04.2024.
//

import SwiftUI

struct IntroView: View {
    
    @AppStorage("isFirstStart") var isFirstStart: Bool?
    @State private var isPresented = false
    @State private var pageIndex = 0
    @Environment(\.dismiss) var dismiss
    @State var isLoading = true
    private let pages: [PageIntro] = PageIntro.sampalePages
    private let dotAppearance = UIPageControl.appearance()
    
    var body: some View {
        ZStack {
            if isLoading {
                LoadingView()
            }else {
            ZStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .bottom)) {
                    
                        TabView(selection: $pageIndex,
                                content:  {
                            ForEach(pages) { page in
                                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                                    PageIntroView(page: page)
                                    
                                    //MARK: - Page number
                                    if page == pages.last {
                                        HStack {
                                            Spacer()
                                            Button {
                                                isPresented = true
                                                isFirstStart = true
                                                dismiss()
                                            } label: {
                                               
                                                    ZStack{
                                                        RoundedRectangle(cornerRadius: 10)
                                                            .foregroundStyle(.redForApp)
                                                        Text("Begin")
                                                            .foregroundStyle(.white)
                                                    }.frame(width: 144, height: 47)
                                                
                                                .padding()
                                        }
                                        }
                                        
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
                        .tabViewStyle(.page(indexDisplayMode: .never))
                        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                        
                        HStack{
                            ForEach(0..<pages.count) {  page in
                                if pageIndex == page {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 38 , height: 4)
                                        .foregroundStyle(.redForApp)
                                }else {
                                    RoundedRectangle(cornerRadius: 15)
                                        .frame(width: 27 , height: 4)
                                        .foregroundStyle(.white)
                                }
                            }
                        }
                    }
                }
                //MARK: - Navigation Button
                HStack {
                    if pageIndex > 0 {
                        Button(action: {
                                pageIndex -= 1
                            
                        }, label: {
                            ZStack {
                                Circle().frame(width: 35, height: 35)
                                Image(systemName: "chevron.left")
                                    .resizable()
                                    .frame(width: 9, height: 15)
                                    .foregroundStyle(.black)
                            }.foregroundStyle(.white)
                        })
                    }
                    Spacer()
                    if pageIndex != (pages.count - 1) {
                        Button(action: {
                                pageIndex += 1
                        }, label: {
                            ZStack {
                                Circle().frame(width: 35, height: 35)
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .frame(width: 9, height: 15)
                                    .foregroundStyle(.black)
                            }.foregroundStyle(.white)
                        })
                    }
                    
                }
            }
        }.onAppear {
            startLoading()
    }
    }
    
    func startLoading(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            isLoading = false
            
        }
    }
    func incrementPage() {
        pageIndex += 1
    }
    
}

#Preview {
    IntroView()
}
