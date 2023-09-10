import SwiftUI

struct DiscoverView: View {
    private let data: [String] = Array(["Health Declaration", "Outing", "Discipline", "Report", "Activity"])
    private let colors: [Color] = [.red, .green, .blue, .yellow]
    
    private let discoverList: [DisoverPageItem] = [
        DisoverPageItem(emoji: "🩺", name: "Health Declaration"),
        DisoverPageItem(emoji: "🗺️", name: "Outing"),
        DisoverPageItem(emoji: "📝", name: "Discipline"),
        DisoverPageItem(emoji: "📒", name: "Report"),
        DisoverPageItem(emoji: "🏃🏻‍♂️", name: "Activity"),
    ]
    
    private let numberColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    private let fixedColumns = [
        GridItem(.fixed(150)),
        GridItem(.fixed(150))
    ]
    
    var body: some View {
        NavigationView{
            List(discoverList) { discoverItem in
                NavigationLink(destination: EmptyView()){
                    HStack{
                        ZStack{
                            Text(discoverItem.emoji)
                                .shadow(radius: 3)
                                .font(.largeTitle)
                                .frame(width: 50, height: 50)
                                .overlay(Circle().stroke(Color.purple, lineWidth: 3))
                        }
                        Text(discoverItem.name)
                            .font(.headline)
                    }.padding(7)
                }
            }
            .navigationTitle("Discover")
        }
    }
    
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
          
          
struct DisoverPageItem: Identifiable{
    let id = UUID()
    let emoji: String
    let name: String
}
