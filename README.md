# Tugas 7: Elemen Dasar Flutter

Nama    : Jihan Syafa Kamila

NPM     : 2106751303

Kelas   : PBP-B

#

## 📱Stateless Widget dan Stateful Widget

Stateless widget, widget yang bersifat statis, adalah widget tersebut yang tidak dapat diubah setelah widget tersebut dibuat. Contoh dari stateless widget adalah Icon, IconButton, dan Text. Widget tersebut akan selalu sama mulai dari dibuat hingga aplikasi dijalankan.

Stateful widget, widget yang bersifat dinamis, adalah widget yang dapat diubah setelah widget tersebut dibuat. Contoh dari stateful widget adalah Checkbox, Radio, Slider, TextField, dan Form. Jika terjadi event sebagai hasil interaksi oleh user, maka widget tersebut dapat memperbarui atau mengubah tampilannya sebagai respons dari pemicu tersebut.

## 💻Widget yang Dipakai dan Fungsinya

| Widget | Fungsi |
| ----- | ----- |
| MaterialApp | Inisiasi title, theme, dan mengatur home dari aplikasi |
| Scaffold | Mengatur layout dari widget yang ada di dalamnya |
| AppBar | Menapilkan bar aplikasi yang berisi title | 
| Text | Menampilkan sebuah teks |
| Center | Mengatur layout widget agar posisinya di tengah |
| Row | Mengatur dan menampilkan layout widget secara horizontal |
| Column | Mengatur dan menampilkan layout widget secara vertikal|
| Container | Membungkus widget-widget yang nantinya dapat dimodifikasi|
| FloatingActionButton | Membuat tombol yang dapat dimodifikasi event di dalamnya |
| Icon | Menampilkan icon yang diinginkan |
| Visibility | Menampilkan atau menyembunyikan sebuah widget |

## 🏷️ Fungsi setState()

Pada program counter_7 yang telah dibuat, fungsi `setState()` mempengaruhi variabel counter. Saat tombol + ditekan, fungsi `setState()` akan dipanggil untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_incrementCounter` akan dijalankan lagi. Ketika tombol - ditekan, fungsi `setState()` juga akan dipanggil untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_decrementCounter` akan dijalankan lagi.

Dengan demikian, `setState()` hanya dipanggil di stateful widget, yaitu ketika state dari widget berubah. Fungsi `setState()` adalah untuk memberitahu widget bahwa ada object yang berubah pada state, sehingga framework akan menjalankan build ulang pada widget tersebut.

## ✏️ Perbedaan const dengan final

| const| final |
| ----- | ----- |
| const digunakan untuk deklarasi variabel *immutable* yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi, artinya adalah nilai dari variabel tersebut harus sudah di berikan atau di-*assign* secara langsung. | final digunakan untuk mendeklarasi variabel *immutable* yang nilai variabelnya sudah atau belum diketahui pada saat waktu kompilasi. Nilai variabel final akan diketahui pada saat run-time. |

## ✨ Implementasi Checklist

✅ **Membuat sebuah program Flutter baru dengan nama counter_7**

Masuk ke direktori yang diinginkan, lalu menjalankan perintah `flutter create counter_7` di terminal.

✅ **Mengubah tampilan program menjadi seperti pada soal**

Menginisiasikan home dan membuat class `MyHomePage` yang berisikan pengaturan `title: 'Program Counter'`. Cara mengimplementasikan logika program counter serta mengatur tampilan konten body ada pada poin berikut.

✅ **Mengimplementasikan logika berikut pada program**

-  **Tombol + menambahkan angka sebanyak satu satuan**

Sebelumnya, telah dideklarasikan variabel counter, yaitu `int _counter = 0;`. Lalu, membuat method bernama `incrementCounter` untuk menambahkan angka sebanyak satu satuan. Apabila tombol + ditekan, maka fungsi `setState()` akan dipanggil.

```
void _incrementCounter() {
    setState(() {
        _counter++;
    });
}
```

-  **Tombol - mengurangi angka sebanyak satu satuan**

Membuat method bernama `decrementCounter` untuk mengurangi angka sebanyak satu satuan. Apabila tombol - ditekan, maka fungsi `setState` akan dipanggil.

```
void _decrementCounter() {
    setState(() {
        if (_counter > 0) {
            _counter--;
        }
    });
}
```

- **Apabila counter bernilai ganjil, maka teks indikator berubah menjadi "GANJIL" dengan warna biru**

Apabila hasil modulo counter dengan 2 tidak sama dengan nol atau ganjil, maka teks yang akan ditampilkan pada program adalah "GANJIL" bewarna biru. Berikut adalah potongan kodenya.

```
if (_counter % 2 != 0)
    const Text(
        'GANJIL',
            style: TextStyle(color: Colors.blue),
    ),
```

- **Apabila counter bernilai genap, maka teks indikator berubah menjadi "GENAP" dengan warna merah**

Apabila hasil modulo counter dengan 2 sama dengan nol atau genap, maka teks yang akan ditampilkan pada program adalah "GENAP" bewarna merah. Berikut adalah potongan kodenya.

```
if (_counter % 2 == 0)
    const Text(
        'GENAPL',
            style: TextStyle(color: Colors.red),
    ),
```

- **Angka 0 dianggap sebagai angka genap** karena hasil modulo 0 dengan 2 adalah 0 sehingga teks yang akan ditampilkan adalah "GENAP".

✅ **BONUS: Menyembunyikan/menghilangkan tombol - apabila counter bernilai 0**

Apabila nilai counter adalah 0, maka tombol yang ditampilkan hanya tombol +. Namun, apabila nilai counter tidak sama dengan 0 maka tombol + dan tombol - akan ditampilkan.

Berikut adalah potongan kodenya.

```
floatingActionButton: Padding(
    padding: const EdgeInsets.only(left: 30.0),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
            Visibility(
                visible: _counter == 0 ? false : true,
                child: FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
                ),
            ),
            FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
            ),
        ],
    ),
),
```

#
# Tugas 8 : Flutter Form

Nama    : Jihan Syafa Kamila

NPM     : 2106751303

Kelas   : PBP-B

## 💻 Perbedaaan Navigator.push dan Navigator.pushReplacement

| Navigator.push | Navigator.pushReplacement |
| -------------- | ------------------------- |
| Method untuk menimpa halaman sebelumnya dengan menambahkan route atau page lain di atas page saat ini. Halaman baru akan ditampilkan di atas halaman sebelumnya. Halaman sebelumnya masih dapat diakses kembali. | Sesuai dengan namanya, yaitu "pushReplacement", method ini akan mengganti route yang ada di stack navigasi dengan route baru dengan melakukan push page baru di mana page lama akan terhapus. Halaman sebelumnya tidak dapat diakses kembali.|  

## 📱 Widget yang Dipakai

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | Card  | Menampilkan sebuah kotak dengan efek bayangan di tepi |
| 2  | Drawer  | Membuat fitur navigasi menuju page lain |
| 3  | Form  | Membuat fitur Form yang menerima input dari pengguna |
| 4  | TextFormField  | Tempat input text |
| 5  | TextButton | Menampilkan button yang dapat diberi tulisan |
| 6  | DropdownButton  | Button yang memunculkan beberapa opsi |
| 7  | SizedBox  | Mengatur ukuran dan memberi jarak antar widget |
| 8  | Dialog  | Menampilkan pop up window pada halaman aplikasi |
| 9  | ListView  | Menampilkan widget yang merupakan *child*-nya |
| 10  | Padding  | Mengatur ruang antar elemen dalam pada widget |
| 11 | Expanded  | Mengatur size child widget agar mengisi tempat yang tersedia |

## 🪄 Jenis-jenis event yang ada pada Flutter 

- `onChanged`, yaitu event yang terjadi ketika widget diubah.
- `onSaved`, yaitu event yang terjadi ketika widget disimpan.
- `onTap `, yaitu event yang terjadi ketika widget di-*tap*.
- `onPressed`, yaitu event yang terjadi ketika widget di tekan atau *press*.
- `onExit`, yaitu event yang terjadi ketika aplikasi ditutup.

## ⚙️ Cara kerja Navigator dalam "mengganti" halaman aplikasi Flutter 

Navigator mengganti halaman dengan memanfaatkan sebuah Stack. Halaman yang ditampilkan untuk pengguna merupakan halaman yang posisinya *top of stack*. Jika ingin mengganti halaman, maka dapat memanfaatkan push untuk menimpa halaman sebelumnya atau pushReplacement untuk mengganti halaman sebelumnya. Navigator mengatur stack of route dengan menggunakan `Navigator.push` dan `Navigator.pop`. Jika ingin kembali atau pindah ke halaman sebelumnya, maka dapat dimanfaatkan operasi pop.

## 📋 Implementasi Checklist

✅ Menambahkan drawer/hamburger menu pada app yang telah dibuat sebelumnya dan menambahkan tiga tombol navigasi pada drawer/hamburger.

Berikut adalah potongan kode untuk menambahkan tiga tombol navigasi untuk ke halaman counter, halaman form, dan halaman yang menampilkan data budget.

```Dart
Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            title: const Text('counter_7'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const BudgetFormPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const DataBudgetPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
```

✅ Menambahkan halaman form dengan membuat file baru, yaitu `formBudget.dart`. Pada file tersebut terdapat potongan kode yang ditambahkan untuk membuat input dengan tipe data String berupa judul budget, input dengan tipe data int berupa nominal budget, dropdown yang berisi tipe budget dengan pilihan pemasukan dan pengeluaran, serta button untuk menyimpan budget.

✅ Menambahkan models pada file `budget.dart` yang memanfaatkan struktur data List untuk menyimpan data yang dibuat.

```Dart
class Budget {
  static List<Budget> budgets = [];
  String judul;
  int nominal;
  String tipe;
  DateTime date;

  Budget({
    required this.judul,
    required this.nominal,
    required this.tipe,
    required this.date,
  });

  static void addBudget({
    required judul,
    required nominal,
    required tipe,
    required date,
  }) {
    budgets.add(Budget(
      judul: judul,
      nominal: nominal,
      tipe: tipe,
      date: date,
    ));
  }
}
```
✅ Membuat file `dataBudget.dart` untuk menampilkan data budget di antaranya adalah judul, nominal, dan tipe budget yang telah diinput pada form.

## ✨ Implementasi Bonus

✅ Menambahkan elemen date picker pada halaman form dengan menambahkan potongan kode berikut pada file `formBudget.dart`.

```Dart
TextButton(
  onPressed: (() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2999),
    ).then((value) {
      setState(() {
        _date = value;
      });
    });
  }),
```

✅ Menampilkan elemen date (format bebas) pada setiap elemen budget yang ada pada halaman data budget.
```Dart
...
children: Budget.budgets.map((budget) {
  return Card(
    child: ListTile(
      title: Text("${budget.judul}\nRp${budget.nominal}"),
      subtitle: Text(budget.date.toString().split(' ')[0]),
      trailing: Text(budget.tipe)),
    );
  }).toList(),
...
```

✅ Refactor widget Drawer ke sebuah file terpisah dengan membuat file baru, yaitu `drawer.dart`, drawer dapat dipanggil dengan potongan kode `Drawer: AppDrawer()`.

# Tugas 9 : Integrasi Web Service pada Flutter

## 📥 Pengambilan data JSON

**Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**

➡️ Pengambilan data JSON tanpa membuat model dapat dilakukan. Caranya yaitu, data JSON akan dikirimkan sebagai HTTP Response dalam bentuk *raw data*. Pengimplementasiannya dapat dilakukan dengan menggunakan `jsonDecode(`) import dari `dart:convert`. Namun, membuat model sebelum melakukan pengambilan data JSON lebih baik karena representasi datanya lebih terstruktur dan efisien. Hal ini disebabkan karena pembuatan model memudahkan developer untuk melakukan operasi pada HTTP Response dengan mengubahnya menjadi dart object, daripada tanpa membuat model yang lebih sulit untuk melihat dan mengakses data yang diperlukan.

## 📱 Widget yang Dipakai

| No | Widget | Fungsi |
| -- | ------------- | ------------- |
| 1  | FutureBuilder | Menampilkan data yang akan diambil dari web service yang mendukung proses asinkron |
| 2  | Drawer  | Membuat fitur navigasi menuju page lain |
| 3  | Padding  | Mengatur ruang antar elemen dalam pada widget |
| 4  | Row | Mengatur dan menampilkan layout widget secara horizontal |
| 5  | ElevatedButton  | Membuat button memiliki shadow dan terlihat menonjol dibandingkan dengan elemen-elemen lainnya |
| 6  | SizedBox  | Mengatur ukuran dan memberi jarak antar widget |

## 💾 Mekanisme pengambilan data dari JSON

Pertama, yang perlu dilakukan adalah membuat model class sesuai dengan response data yang akan diambil ketika melakukan pemanggilan web service. Selanjutnya, data akan di-fetch atau ambil dari web service yang nantinya akan ditampilkan dengan memanfaatkan FutureBuilder. Data yang di fetch ini, diambil melalui `HTTP GET` request yang mengambil data dari URL yang diiginkan. Sebuah response akan dikembalikan dengan memanfaatkan metode `http.get.`. Response ini akan dikonversi menjadi objek Dart yang nanti diiterasi agar dapat ditampilkan pada aplikasi.

## ✨ Implementasi Checklist dan Bonus

- Membuat 3 (tiga) folder baru dengan nama `model`, `page`, dan `utils`. Pada folder model terdapat file budget.dart dan mywatchlist.dart, dan pada folder utils terdapat file fetchwatchlistdata.dart. Di dalam folder page, dibuat lagi folder `Budget` dan `Watchlist`. Pada folder Budget berisi file dataBudget.dart dan formBudget.dart sedangkan pada folder Watchlist berisi file mywatchlistdetail.dart dan mywatchlistpage.dart. 

- File fetchwatchlistdata.dart berisi potongan kode yang akan mengambil data dari URL situs web tugas mywatchlist sebelumnya. File ini juga sudah di refactor ke sebuah file terpisah untuk mengimplementasikan bonus.

```Dart
Future<List<MyWatchList>> fetchWatchList() async {
  var url = Uri.parse(
      'https://pbp-tugas2-jihansyafakamila.herokuapp.com/mywatchlist/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<MyWatchList> listWatchList = [];
  for (var d in data) {
    if (d != null) {
      listWatchList.add(MyWatchList.fromJson(d));
    }
  }

  return listWatchList;
}
```

- Membuat file baru pada folder page dengan nama mywatchlistpage.dart untuk menampilkan seluruh judul dari objek MyWatchList pada halaman My Watch List.

- Membuat file baru pada folder page dengan nama mywatchlistdetail.dart untuk menampilkan halaman detail untuk setiap objek mywatchlist. Setiap detail akan menampilkan release date, rating, status, dan review.

- Menambahkan checkbox dengan widget Checkbox untuk menandakan film tersebut sudah ditonton atau belum. Dengan menggunakan event handler, yaitu onChanged() akan melakukan operasi setState() untuk mengubah status ditonton pada saat checkbox ditekan.

- Menambahkan warna untuk outline pada setiap mywatchlist pada halaman mywatchlist berdasarkan status ditonton dua pilihan warna untuk status yang bernilai true akan berwarna green sedangkan untuk status yang bernilai false akan bewarna red.