//
//  Menu.swift
//  bitesize
//
//  Created by Paraptughessa Premaswari on 08/10/23.
//

import Foundation
import FirebaseFirestoreSwift

struct Menu: Codable {
    @DocumentID var id: String?
    var name: String
    var desc: String
    var step: [String]
    var nutrisi: [String: Double]
    var kalori: Double
    var bahan: [String:[String: String]]
    var usia: Int
    var jenis: [String]
}

//var menu = [
//    Menu(name: "Bubur Hati Ayam",
//         bahan: ["Nasi" : 20, "Hati Ayam": 10, "Bayam": 4, "Minyak Jagung": 2.5, "Garam" : 0, "Bawang Putih": 1, "Bawang Merah": 1, "Jahe": 1],
//         step: [
//            "Tumis bumbu halus hingga harum.",
//            "Tambahkan hati ayam, masak hingga berubah warna.",
//            "Masukkan bayam dan garam secukupnya, masak hingga matang.",
//            "Tambahkan nasi, lalu saring hingga teksturnya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Hati Ayam Santan",
//         bahan: ["Nasi" : 20, "Hati Ayam": 10, "Wortel": 0.33, "Santan Cair": 17, "Minyak Jagung": 2.5, "Garam" : 0, "Air": 0, "Bawang Merah": 1, "Bawang Putih": 1],
//         step: [
//            "Tumis bumbu halus hingga harum.",
//            "Tambahkan wortel dan hati ayam, lalu tambahkan air secukupnya.",
//            "Masak hingga matang dan air berkurang.",
//            "Masukkan santan dan garam secukupnya, aduk hingga merata.",
//            "Tambahkan nasi, lalu saring hingga teksturnya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Pepes Hati Ayam",
//         bahan: ["Nasi" : 20, "Hati Ayam": 15, "Wortel": 0.33, "Tomat": 4, "Minyak Jagung": 2.5, "Garam" : 0, "Gula": 0, "Bawang Merah": 1, "Jahe": 1, "Daun Jeruk": 0.33, "Daun Salam": 0.33, "Kemangi": 0, "Bawang Putih": 1, "Kunyit": 0, "Lengkuas": 0, "Serai": 0],
//         step: [
//            "Campurkan wortel, tomat, daun salam, daun jeruk, dan kemangi dengan bumbu halus.",
//            "Aduk hingga rata.",
//            "Masukkan hati ayam dan minyak kelapa, lalu bungkus dengan daun pisang.",
//            "Kukus hingga matang.",
//            "Ketika akan dicampur dengan nasi, ambil daun salam, kemangi, dan daun jeruknya, lalu saring hingga teksturenya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Udang Tahu",
//         bahan: ["Nasi" : 20, "Udang": 15, "Santan Cair": 10, "Tahu": 7, "Tomat": 4, "Garam" : 0, "Gula": 0, "Bawang Merah": 1, "Jahe": 1, "Jeruk Nipis": 0, "Daun Salam": 0.33, "Kemangi": 0, "Bawang Putih": 1, "Kemiri": 0.33],
//         step: [
//            "Lumuri udang dengan air jeruk nipis dan garam, lalu diamkan sekitar 15 menit.",
//            "Campur udang, tahu, tomat, kemangi, santan cair, dan bumbu halus hingga merata.",
//            "Bungkus dengan daun pisang, masukkan juga daun salam.",
//            "Kukus hingga matang.",
//            "Ketika akan dicampur dengan nasi, ambil daun salam, kemangi, dan daun jeruknya, lalu saring hingga teksturenya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Udang Buncis",
//         bahan: ["Nasi" : 20, "Udang": 14, "Buncis": 4, "Minyak Jagung": 2.5, "Garam" : 0, "Bawang Merah": 1, "Jeruk Nipis": 0, "Bawang Putih": 1],
//         step: [
//            "Lumuri udang dengan air jeruk nipis dan garam, lalu diamkan sekitar 15 menit.",
//            "Tumis bumbu halus hingga harum.",
//            "Masukkan udang dan buncis hingga matang.",
//            "Tambahkan nasi, lalu saring hingga teksturnya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Daging Sapi",
//         bahan: ["Nasi" : 20, "Daging Sapi": 17, "Bayam": 5, "Minyak Jagung": 2.5, "Garam" : 0, "Bawang Merah": 1, "Bawang Putih": 1],
//         step: [
//            "Kukus daging sapi giling yang sudah dicampur bumbu halus di dalam wadah tahan panas hingga matang.",
//            "Tambahkan bayam.",
//            "Masukkan Minyak kelapa dan garam secukupnya.",
//            "Tambahkan nasi, lalu saring hingga teksturnya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Patin",
//         bahan: ["Nasi" : 20, "Hati Ayam": 10, "Ikan Patin": 10, "Minyak Jagung": 2.5, "Tomat": 4, "Garam" : 0, "Bawang Merah": 1, "Bawang Putih": 1, "Bawang Bombai": 1, "Daun Jeruk": 0.33, "Daun Salam": 0.33, "Jahe": 1, "Seledri": 0, "Air": 0, "Jeruk Nipis": 0],
//         step: [
//            "Lumuri ikan patin dan hati ayam dengan jeruk nipis dan garam, diamkan 15 menit.",
//            "Campur ikan patin dan hati ayam dengan bumbu halus, tambahkan tomat, bawang bombai, jahe, seledri, daun salam, dan daun jeruk, tambahkan minyak jagung.",
//            "Kukus hingga matang",
//            "Ketika akan dicampur dengan nasi, ambil daun salam daun jeruknya, lalu saring hingga teksturenya sesuai dengan yang diinginkan."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Hati dan Ayam",
//         bahan: ["Beras" : 10, "Hati Ayam": 10, "Dada Ayam": 10, "Minyak Kanola": 2.5, "Brokoli": 4, "Garam" : 0, "Bawang Merah": 1, "Bawang Putih": 1, "Kaldu Ayam": 20, "Air": 40, "Tahu": 5, "Jahe": 1],
//         step: [
//            "Masak beras dengan air dan kaldu ayam sampai menjadi bubur.",
//            "Masukkan brokoli.",
//            "Tumis bumbu halus hingga harum.",
//            "Tambahkan hati dan dada ayam, aduk hingga berubah warna, lalu masukkan tahu.",
//            "Tambahkan tumisan hati, dada ayam, dan tahu ke dalam bubur, lalu beri garam secukupnya.",
//            "Masak hingga matang."
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Tenggiri",
//         bahan: ["Beras" : 10, "Ikan Tenggiri": 15, "Buncis": 5, "Kaldu Ayam": 50, "Minyak Kelapa Sawit": 2.5, "Garam" : 0, "Bawang Merah": 1, "Bawang Putih": 1],
//         step: [
//            "Tumis bumbu halus sampai harum.",
//            "Masukkan daging ikan tenggiri dan buncis, aduk sampai matang, lalu haluskan.",
//            "Didihkan air kaldu, masukkan beras, aduk beras hingga menjadi bubur kasar.",
//            "Masukkan tumisan ikan dan garam secukupnya, aduk hingga semua bahan matang.",
//         ],
//         kategori: "Makanan Utama"),
//    Menu(name: "Bubur Ayam Mentega",
//         bahan: ["Beras" : 10, "Daging Ayam": 10, "Telur": 0.33, "Wortel": 0.33, "Mentega": 0.5, "Garam" : 0, "Bawang Merah": 1, "Bawang Putih": 1],
//         step: [
//            "Tumis bumbu halus dengan mentega sampai harum.",
//            "Masukkan daging ayam giling, aduk sampai berubah warna.",
//            "Masukkan beras dan air kaldu ke dalam panci, tambahkan tumisan ayam, wortel, dan garam secukupnya.",
//            "Masak sambil diaduk hingga beras menjadi bubur. Masukkan telur kocok, aduk rata.",
//            "Angkat bubur, lalu saring."
//         ],
//         kategori: "Makanan Utama"),
//
//    Menu(name: "Pure Alpukat Jeruk",
//         bahan: ["Alpukat" : 30, "Jeruk Peras": 20],
//         step: [
//            "Campurkan alpukat dengan jeruk peras, lalu haluskan."
//         ],
//         kategori: "Cemilan"),
//    Menu(name: "Pure Pisang Apel",
//         bahan: ["Apel" : 50, "Pisang": 50, "Yoghurt": 2],
//         step: [
//            "Haluskan apel (jika diperlukan, boleh dikukus terlebih dahulu).",
//            "Campur dengan pisang yang sudah dihaluskan.",
//            "Tambahkan yoghurt, lalu aduk rata."
//         ],
//         kategori: "Cemilan"),
//]
