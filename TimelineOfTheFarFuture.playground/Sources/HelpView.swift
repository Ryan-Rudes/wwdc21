import SwiftUI

struct HelpView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    Group {
                        Text("What is this?")
                            .foregroundColor(.orange)
                            .font(.title2)
                            .bold()
                        
                        Text("Explore a timeline of the distant future. Read projections under various scientific disciplines. These events are not fictional, but rather events that are actually estimated to occur at roughly the indicated time based on scientific law. Some of the relatively closer events are denoted by a year, e.g. 3015 CE. The others are simply denoted by a number which tells you the number of years before the event takes place, e.g. 250,000.")
                            .bold()
                    }
                    
                    Group {
                        Text("Categories")
                            .foregroundColor(.blue)
                            .font(.title2)
                            .bold()
                        
                        Text("There are 6 main categories in which the events are divided into:")
                            .bold()
                        
                        VStack {
                            ForEach(Category.allCases, id: \.self) { category in
                                if category != .all {
                                    HStack {
                                        Text(String(describing: category).capitalized)
                                            .bold()
                                        Spacer()
                                        Orbital(category: category,
                                                rotating: false)
                                            .scaleEffect(0.7)
                                            .frame(width: 50, height: 50)
                                    }
                                }
                            }
                        }
                    }
                    
                    Group {
                        Text("You may also choose to look at all categories combined:")
                            .bold()
                        
                        HStack {
                            Text("All")
                                .bold()
                            Spacer()
                            Orbital(category: .all,
                                    rotating: false)
                                .scaleEffect(0.7)
                                .frame(width: 50, height: 50)
                        }
                    }
                    
                    Group {
                        Text("Sources")
                            .foregroundColor(.purple)
                            .font(.title2)
                            .bold()
                        
                        Text("These projections are sourced from the Wikipedia page titled, \"Timeline of the far future\"")
                            .bold()
                        
                        Text("https://en.wikipedia.org/wiki/Timeline_of_the_far_future")
                            .foregroundColor(.blue)
                            .bold()
                    }
                    Spacer()
                }
            }
            .padding(.horizontal)
            .navigationTitle("Help")
            .navigationBarItems(leading:
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.red)
                        .imageScale(.large)
                        .background(Color.white)
                        .clipShape(Circle())
                }
            )
        }
        .preferredColorScheme(.dark)
    }
}
