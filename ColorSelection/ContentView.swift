//
//  ContentView.swift
//  ColorSelection
//
//  Created by Naufal Adli on 20/02/24.
//

import SwiftUI

struct ColorM: Identifiable{
    var id = UUID()
    var color: Color
}

struct ContentView: View {
    @State var colors: [ColorM] = [ ColorM(color: .cyan), ColorM(color: .red), ColorM(color: .green), ColorM(color: .yellow), ColorM(color: .brown),ColorM(color: .orange),ColorM(color: .mint)
                                    ,ColorM(color: .pink), ColorM(color: .purple), ColorM(color: .blue)
    ]
    
    @State var selectedC: Color = .cyan
    
    var body: some View {
        HStack{
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 100,height: 100)
                .foregroundColor(selectedC)
            
            LazyHGrid(rows: Array(repeating: GridItem(), count: 2), content: {
                ForEach(colors){ color in
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundStyle(color.color)
                        .opacity(0.8)
                        .scaleEffect(selectedC == color.color ? 0.7 : 1)
                        .overlay{
                            Circle()
                                .stroke(lineWidth: 3)
                                .foregroundColor(selectedC == color.color ? .white : .clear)
                        }
                        .onTapGesture {
                            withAnimation{
                                selectedC = color.color
                            }
                        }
                }
            }).frame(height: 100)
        }
        .padding()
        .background(.black.opacity(0.8),in: RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    ContentView()
}
