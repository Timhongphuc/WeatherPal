//
//  TestforGlass.swift
//  Weather-Pal
//
//  Created by Tim Seufert on 22.08.25.
//

import SwiftUI

struct TestforGlass: View {
    var body: some View {
        ZStack{

            LinearGradient(colors: [Color.teal, Color.blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea(edges: .all)
                
                VStack{
                    Spacer(minLength: 670)
                    HStack{
                        Spacer(minLength: 200)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.primary.opacity(0.32))
                            .colorInvert()
                        // .frame(width: 180, height: 100)
                        // .position(x:100, y:620)
                            .padding(5)
                        Spacer(minLength: 2)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                    }
                }
                
                VStack{
                    Spacer(minLength: 670)
                    HStack{
                        Spacer(minLength: 3)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.primary.opacity(0.32))
                            .colorInvert()
                        // .frame(width: 180, height: 100)
                        // .position(x:100, y:620)
                            .padding(5)
                        Spacer(minLength: 200)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                    }
                }
                
                VStack{
                    Spacer(minLength: 554)
                    HStack{
                        Spacer(minLength: 3)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.primary.opacity(0.32))
                            .colorInvert()
                        // .frame(width: 180, height: 100)
                        // .position(x:100, y:620)
                            .padding(5)
                        Spacer(minLength: 200)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                    }
                    Spacer(minLength: 110)
                }
                
                HStack{
                    Spacer(minLength: 199)
                    VStack{
                        Spacer(minLength: 553)
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color.primary.opacity(0.32))
                            .colorInvert()
                        // .frame(width: 180, height: 100)
                        // .position(x:100, y:620)
                            .padding(7)
                        Spacer(minLength: 108)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 3)
                    }
                }
            
            }
        }
    }

#Preview {
    TestforGlass()
}
