import SwiftUI

struct BottomNav: View {
    var body: some View {
        TabView{
            HomeView().tabItem(){
                Label("Home", systemImage: "house")
            }
            DiscoverView().tabItem(){
                Label("Discover", systemImage: "safari")
            }
            ProfileView().tabItem(){
                Label("Profile", systemImage: "person.fill")
            }

        }
    }
}

struct BottomNav_Previews: PreviewProvider {
    static var previews: some View {
        BottomNav()
    }
}
