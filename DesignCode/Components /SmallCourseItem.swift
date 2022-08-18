import SwiftUI

struct SmallCourseItem: View {
    var course: Course = courses[0]
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.black.opacity(0.1))
                .overlay(Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150 ,height: 110 )
            )
            Text(course.subtitle)
                .font(.caption)
                .foregroundColor(.secondary)
                .lineLimit(1)
            Text(course.title)
                .fontWeight(.semibold)
            
        }
        .padding()
        .frame(width: 160, height: 200)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

struct SmallCourseItem_Previews: PreviewProvider {
    static var previews: some View {
        SmallCourseItem()
    }
}
