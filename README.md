# FinHack 2018 Code Sample
Sebagai pemula di bidang data science, saya mencoba ikut serta di event FinHack 2018 ini. Hasilnya masih jauh dari kemampuan peserta lain yang ikut serta dalam event ini. Berikut adalah code yang saya tulis untuk menyelesaikan ketiga kasus di event ini.

Kasus yang ada pada event ini adalah:
- Fraud Detection.
- Credit Scoring.
- ATM Cash Optimization.

## Fraud Detection
Untuk mencegah dan mendeteksi fraud, bank wajib memiliki dan menerapkan strategi anti fraud yang efektif. Hal ini bisa dilakukan dengan menganalisa data transaksi untuk mencari pola-pola yang mencurigakan sehingga mempermudah identifikasi suatu transaksi sebagai transaksi yang sah atau bukan. Hasilkanlah solusi model Fraud Detection yang canggih dengan memanfaatkan dataset yang sudah kami sediakan.
Dataset train pada kasus ini berjumlah 13.125 sample dengan feature sebagai berikut:
```
 [1] "X"                          "id_tanggal_transaksi_awal"  "tanggal_transaksi_awal"    
 [4] "tipe_kartu"                 "id_merchant"                "nama_merchant"             
 [7] "tipe_mesin"                 "tipe_transaksi"             "nama_transaksi"            
[10] "nilai_transaksi"            "id_negara"                  "nama_negara"               
[13] "nama_kota"                  "lokasi_mesin"               "pemilik_mesin"             
[16] "waktu_transaksi"            "kuartal_transaksi"          "kepemilikan_kartu"         
[19] "nama_channel"               "id_channel"                 "flag_transaksi_finansial"  
[22] "status_transaksi"           "bank_pemilik_kartu"         "rata_rata_nilai_transaksi" 
[25] "maksimum_nilai_transaksi"   "minimum_nilai_transaksi"    "rata_rata_jumlah_transaksi"
[28] "flag_transaksi_fraud"
```
Kasus ini adalah klasifikasi dua class dengan data tidak seimbang, artinya ada class yang memiliki jumlah sample yang lebih besar daripada class yang lain. Class yang 
Untuk menyelesaikan kasus ini kami melakukan beberapa proses, yaitu:
- Membersihkan sample yang memiliki kemiripan pada class mayoritas. Hasilnya berhasil dikurangi kurang lebih 

## Credit Scoring
Pemberian pinjaman adalah salah satu proses bisnis utama sebuah bank. Bank dituntut untuk mampu mengelola pinjaman nasabah-nasabahnya dengan cermat. Oleh karena itu, pada challenge ini, tugas anda adalah menghasilkan model prediksi yang dapat memperkirakan apakah seorang nasabah akan macet pembayaran pinjamannya atau tidak.

## ATM Cash Optimization
Sebuah ATM yang sering kehabisan uang tunai dapat memberikan pengalaman yang kurang menyenangkan bagi nasabah. Namun, uang tunai di ATM yang mengendap terlalu lama juga dapat menghambat perputaran uang di bank. Berdasarkan permasalahan tersebut anda diharapkan dapat menghasilkan model prediksi yang dapat meningkatkan efisiensi pengelolaan uang di ATM.
