import SwiftUI


struct IngredientsPickerView: View {
    @State var ingredients: [Ingredient] = [Ingredient(name: "Salt"),
                                            Ingredient(name: "Pepper"),
                                            Ingredient(name: "Chili"),
                                            Ingredient(name: "Milk")]
    
    var body: some View{
        List{
            ForEach(0..<ingredients.count){ index in
                HStack {
                    Button(action: {
                        self.ingredients[index].isSelected = self.ingredients[index].isSelected ? false : true
                    }) {
                        HStack{
                            if self.ingredients[index].isSelected {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                                    .animation(.easeIn)
                            } else {
                                Image(systemName: "circle")
                                    .foregroundColor(.primary)
                                    .animation(.easeOut)
                            }
                            Text(self.ingredients[index].name)
                        }
                    }.buttonStyle(BorderlessButtonStyle())
                }
            }
        }
    }
}
struct Ingredient{
    var id = UUID()
    var name: String
    var isSelected: Bool = false
}

struct NotReallyAPicker_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsPickerView()
    }
}
