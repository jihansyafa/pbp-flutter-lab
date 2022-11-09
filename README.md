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

## 🏷️Fungsi setState()

Pada program counter_7 yang telah dibuat, fungsi `setState()` mempengaruhi variabel counter. Saat tombol + ditekan, fungsi `setState()` akan dipanggil untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_incrementCounter` akan dijalankan lagi. Ketika tombol - ditekan, fungsi `setState()` juga akan dipanggil untuk memberitahu bahwa terjadi perubahan pada state sehingga method `_decrementCounter` akan dijalankan lagi.

Dengan demikian, `setState()` hanya dipanggil di stateful widget, yaitu ketika state dari widget berubah. Fungsi `setState()` adalah untuk memberitahu widget bahwa ada object yang berubah pada state, sehingga framework akan menjalankan build ulang pada widget tersebut.

## ✏️Perbedaan const dengan final

| const| final |
| ----- | ----- |
| const digunakan untuk deklarasi variabel *immutable* yang nilainya bersifat konstan dan harus sudah diketahui pada saat waktu kompilasi, artinya adalah nilai dari variabel tersebut harus sudah di berikan atau di-*assign* secara langsung. | final digunakan untuk mendeklarasi variabel *immutable* yang nilai variabelnya sudah atau belum diketahui pada saat waktu kompilasi. Nilai variabel final akan diketahui pada saat run-time. |

## ✨Implementasi Checklist

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

Apabila hasil modulo counter dengan 2 tidak sama dengan nol atau ganjil, maka teks yang akan ditampilkan pada program adalah "GANJIL" bewarna biru. Berikut adalah potongan kodenya.

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
