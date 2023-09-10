import SwiftUI
import FirebaseAuth

struct HomeView: View {
    
    private let emojiList: [EmojiItem] = [
        EmojiItem(
          emoji: "👾",
          title: "Outing",
          datePublished: "2 Feb 2023",
          posterName:"Senah",
          description: "A friendly-looking, tentacled space creature with two eyes."),
        EmojiItem(
          emoji: "🥑",
          title: "Avocado",
          datePublished: "12 Aug 2023",
          posterName:"Ali",
          description: "A pear-shaped avocado, sliced in half to show its yellow-green flesh and "
            + "large brown pit."),
        EmojiItem(
          emoji: "🍟",
          title: "French Fries",
          datePublished: "4 Aug 2023",
          posterName:"",
          description: "Thin-cut, golden-brown French fries, served in a red carton, as at "
            + "McDonald’s."),
        EmojiItem(
          emoji: "🍕",
          title: "Pizza",
          datePublished: "31 Aug 2023",
          posterName:"Mahmud",
          description: "A slice of pepperoni pizza, topped with black olives on Google. WhatsApp "
            + "adds green pepper, Samsung white onion."),
        EmojiItem(
          emoji: "🧩",
          title: "Puzzle Piece",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "Puzzle Piece was approved as part of Unicode 11.0 in 2018 under the name "
            + "“Jigsaw Puzzle Piece” and added to Emoji 11.0 in 2018."),
        EmojiItem(
          emoji: "🚀",
          title: "Rocket",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "A rocket being propelled into space."),
        EmojiItem(
          emoji: "🗽",
          title: "Statue of Liberty",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "The Statue of Liberty, often used as a depiction of New York City."),
        EmojiItem(
          emoji: "🧸",
          title: "Teddy Bear",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "A classic teddy bear, as snuggled by a child when going to sleep."),
        EmojiItem(
          emoji: "🦄",
          title: "Unicorn",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "The face of a unicorn, a mythical creature in the form of a white horse with "
            + "a single, long horn on its forehead."),
        EmojiItem(
          emoji: "👩🏽‍💻",
          title: "Woman Technologix`st",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "A woman behind a computer screen, working in the field of technology."),
        EmojiItem(
          emoji: "🗺",
          title: "World Map",
          datePublished: "31 Aug 2023",
          posterName:"",
          description: "A rectangular map of the world. Generally depicted as a paper map creased at "
            + "its folds, Earth’s surface shown in green on blue ocean."),
      ]
    
    var body: some View {
        NavigationView{
            List(emojiList) { emojiItem in
                NavigationLink(destination: EmptyView()){
                    VStack(alignment:.leading){
                        
                        if (emojiItem.datePublished.count > 1){
                            HStack{
                                Text(emojiItem.datePublished)
                                    .font(.footnote)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 2, trailing: 0))
                        }
                        
                        VStack(alignment:.leading){
                            HStack{
                                Text(emojiItem.title)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)

                                Text("by " + emojiItem.posterName)
                                    .font(.footnote)
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                    .opacity((emojiItem.posterName.count > 1) ? 1 : 0)
                            }
                            .padding(EdgeInsets.init(top: 0, leading: 0, bottom: 2, trailing: 0))

                            Text(emojiItem.description)
                                .font(.subheadline)
                        }
                    }
                    
                                  }
            }
            .navigationTitle("Home")
        }
    }
}

struct CircleView: View {
    
    let emojiItem : EmojiItem
    
    var body: some View{
        ZStack{
            Text(emojiItem.emoji)
                .shadow(radius: 3)
                .font(.largeTitle)
                .frame(width: 50, height: 50)
                .overlay(Circle().stroke(Color.purple, lineWidth: 3))
        }
    }
    
}

struct EmojiItem: Identifiable{
    let id = UUID()
    let emoji: String
    let title: String
    let datePublished: String
    let posterName: String
    let description: String
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
