
import SwiftUI

struct ContentView: View {
    @State var rectangleColor: [Color] = Color.randomColorsN(n: 9)
    @State var textColor: Color = .yellow
    @State var bgColor: Color = .black
    var body: some View {
        VStack {
            Spacer()
            Grid {
                GridRow {
                    ForEach(0..<3,content: { item in
                        ColorGridView(color: rectangleColor[item], corner: 15,dimension: 80)
                    })
                }
                GridRow {
                    ForEach(3..<6,content: { item in
                        ColorGridView(color: rectangleColor[item], corner: 15,dimension: 80)
                    })
                }
                GridRow {
                    ForEach(6..<9,content: { item in
                        ColorGridView(color: rectangleColor[item], corner: 15,dimension: 80)
                    })
                }
            }
            Spacer()
            
            Button(action: {
                withAnimation(.spring()) {
                    rectangleColor = Color.randomColorsN(n: rectangleColor.count)
                }
            }, label: {
                Text("Random Colors")
                    .foregroundColor(textColor)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(bgColor)
                    )
            })
        }
        .onAppear {
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorGridView: View {
    
    let color: Color
    let corner: CGFloat
    let dimension: CGFloat
    
    var body: some View {
        RoundedRectangle(cornerRadius: corner)
            .fill(color)
            .frame(width: dimension,height: dimension)
            .overlay(content: {
                RoundedRectangle(cornerRadius: corner)
                    .stroke()
            })
            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            .shadow(color: .random, radius: 5,x: 5,y: 5)
        
    }
}
