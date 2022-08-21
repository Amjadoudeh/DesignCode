import SwiftUI

struct Certificate: View {
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 8) {
                Text("SwiftUI for iOS 15")
                    .font(.title3.weight(.semibold))
                Text("Certificate")
                    .font(.subheadline.weight(.medium))
                    .foregroundStyle(.secondary)
            }
            Spacer()
            VStack(alignment: .leading, spacing: 8) {
                Text("April 18th".uppercased())
                    .font(.footnote.weight(.semibold))
                Text("DesignCode: Amjad Oudeh".uppercased())
                    .font(.footnote.weight(.medium))
            }
            .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(Image("Logo 2")
            .resizable(resizingMode: .stretch)
            .aspectRatio(contentMode: .fit)
            .frame(width: 26.0, height: 26.0)
            .cornerRadius(10.0)
            .padding(9)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
            .strokeStyle(cornerRadius: 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity , alignment: .topTrailing)
        )
        .padding(20)
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
    }
}

struct Certificate_Previews: PreviewProvider {
    static var previews: some View {
        Certificate()
    }
}
