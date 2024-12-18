import SwiftUI

struct ShoppingView: View {
    @StateObject private var viewModel = ShoppingViewModel() // ربط نموذج العرض
    @FocusState private var isTextFieldFocused: Bool // حالة التركيز على حقل النص
    @State private var showAlert = false // حالة عرض نافذة الإدخال
    @State private var newItemName = "" // اسم العنصر الجديد

    var body: some View {
        NavigationView {
            VStack {
                // قسم العنوان مع أيقونة السلة
                HStack {
                    Text("التسوق")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.leading, 210)
                    Spacer()
                    Button(action: {
                        viewModel.addItem(name: "عنصر جديد")
                    }) {
                        Image(systemName: "cart.fill") // أيقونة السلة
                            .foregroundColor(.purple)
                            .font(.title)
                    }
                }
                .padding()
                
                // أيقونة المايك تحت العنوان
                Button(action: {
                    showAlert = true // عرض نافذة الإدخال
                }) {
                    Image(systemName: "mic.fill") // أيقونة المايك
                        .foregroundColor(.purple)
                        .font(.largeTitle)
                        .padding(.leading, 320)
                        .padding(.top, 30)
                }
                .padding(.bottom, -30)

                // قائمة التسوق
                List {
                    ForEach(viewModel.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            if item.isCompleted {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                    .onDelete(perform: viewModel.deleteItem) // حذف العناصر
                }
                .scrollContentBackground(.hidden) // إزالة الخلفية الرمادية الافتراضية
            }
            .background(Color.white) // الخلفية البيضاء
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // زر المهام على اليسار
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("تم الضغط على زر المهام")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                        Text("المهام")
                            .font(.headline)
                            .foregroundColor(.blue)
                    }
                }
                
                // زر التعديل على اليمين
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton() // زر التعديل
                }
            }
            .alert("إضافة عنصر جديد", isPresented: $showAlert) {
                TextField("اسم العنصر", text: $newItemName)
                Button("إضافة") {
                    if !newItemName.isEmpty {
                        viewModel.addItem(name: newItemName)
                        newItemName = "" // إعادة تعيين النص
                    }
                }
                Button("إلغاء", role: .cancel) {
                    newItemName = "" // إعادة تعيين النص
                }
            }
            .onAppear {
                // تأخير بسيط لضمان تركيز لوحة المفاتيح إذا احتجنا
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    isTextFieldFocused = true
                }
            }
        }
        .background(Color.white) // خلفية NavigationView
    }
}

struct ShoppingView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingView()
    }
}
