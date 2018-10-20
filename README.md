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
Class label atau variable response dari data di atas adalah flag_transaksi_fraud yang bernilai 1 untuk transaksi fraud dan 0 untuk transaksi normal. Berikut ini adalah jumlah sample untuk masing-masing class label.
```
    0     1 
12215   910
```
Dari data tersebut maka dapat diketahui bahwa ini adalah kasus klasifikasi data tidak seimbang, karena ada class yang memiliki jumlah sample yang lebih besar daripada class yang lain. Hal ini akan mempengaruhi akurasi prediksi terhadap class minoritas, sehingga akan menyebabkan kesalahan dalam memprediksi class minoritas.
Untuk menyelesaikan kasus ini kami melakukan beberapa proses, yaitu:
- Membersihkan sample yang memiliki kemiripan pada class mayoritas. 
- Melakukan penyeimbangan jumlah sample kedua class dengan metode undersampling dan oversampling.
- Membuat model dengan algoritmat [Random Forest](https://www.rdocumentation.org/packages/randomForest/versions/4.6-14/topics/randomForest).
Berikut adalah hasil perhitungan kinerja model dengan ROC yang saya dapatkan.

Metode | ROC | Sens      | Spec
------- | ---------------- | ---------- | ---------:
Original | 0.8917839 | 0.9873698 | 0.4241758
Undersampling | 0.8759569 | 0.8276226 | 0.7747253
Oversampling | 0.8867366 | 0.9809032 | 0.4296703
ROSE | 0.7519298 | 0.9824200 | 0.19780220
SMOTE | 0.8787502 | 0.9129022 | 0.6351648

Nilai ROC di atas masih jauh di bawah nilai peserta lain yang memiliki nilai ROC antara 0.9088 - 0.925.

## Credit Scoring
Pemberian pinjaman adalah salah satu proses bisnis utama sebuah bank. Bank dituntut untuk mampu mengelola pinjaman nasabah-nasabahnya dengan cermat. Oleh karena itu, pada challenge ini, tugas anda adalah menghasilkan model prediksi yang dapat memperkirakan apakah seorang nasabah akan macet pembayaran pinjamannya atau tidak.

Dataset train pada kasus ini berjumlah 15.493 sample dengan feature sebagai berikut:
```
 [1] "X"                                   "jumlah_kartu"                       
 [3] "outstanding"                         "limit_kredit"                       
 [5] "tagihan"                             "total_pemakaian_tunai"              
 [7] "total_pemakaian_retail"              "sisa_tagihan_tidak_terbayar"        
 [9] "kode_cabang"                         "rasio_pembayaran"                   
[11] "persentasi_overlimit"                "rasio_pembayaran_3bulan"            
[13] "rasio_pembayaran_6bulan"             "skor_delikuensi"                    
[15] "flag_kredit_macet"                   "jumlah_tahun_sejak_pembukaan_kredit"
[17] "total_pemakaian"                     "sisa_tagihan_per_jumlah_kartu"      
[19] "sisa_tagihan_per_limit"              "total_pemakaian_per_limit"          
[21] "pemakaian_3bln_per_limit"            "pemakaian_6bln_per_limit"           
[23] "utilisasi_3bulan"                    "utilisasi_6bulan"
```
Class label atau variable response dari data di atas adalah flag_kredit_macet yang bernilai 1 untuk kredit macet dan 0 untuk kredit lancar. Berikut ini adalah jumlah sample untuk masing-masing class label.
```
    0     1 
14134  1359
```
Cara yang saya lakukan untuk menyelesaikan kasus ini adalah sama dengan cara pada kasus sebelumnya. Berikut adalah hasil perhitungan kinerja model dengan ROC yang saya dapatkan.

Metode | ROC | Sens      | Spec
------- | ---------------- | ---------- | ---------:
Original | 0.8954414 | 0.9738138 | 0.3436483
Undersampling | 0.8872178 | 0.7903321 | 0.8241290
Oversampling | 0.8944726 | 0.9535795 | 0.4731414
ROSE | 0.7496470 | 0.7565760 | 0.5150667
SMOTE | 0.8872079 | 0.8689798 | 0.7019617

Nilai ROC peserta lain adalah antara 0.870 - 0.877.

## ATM Cash Optimization
Sebuah ATM yang sering kehabisan uang tunai dapat memberikan pengalaman yang kurang menyenangkan bagi nasabah. Namun, uang tunai di ATM yang mengendap terlalu lama juga dapat menghambat perputaran uang di bank. Berdasarkan permasalahan tersebut anda diharapkan dapat menghasilkan model prediksi yang dapat meningkatkan efisiensi pengelolaan uang di ATM.
