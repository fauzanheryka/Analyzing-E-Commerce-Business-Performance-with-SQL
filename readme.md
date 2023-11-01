# **Analyzing E-Commerce Business Performance with SQL**
**Tool** : PostgreSQL <br> 
**Visualization** : Looker Studio <br>
**Dataset** : Rakamin Academy - [E commerce Brazilian Data]()
<br>
--

**Table of Contents**
- [STAGE 0: Problem Statement](https://github.com/faizns/Analyzing-eCommerce-Business-Performance-with-SQL/blob/main/README.md#-stage-0:-problem-statement)
	- [Background Story](#background-story)
	- [Objective](#objective)
- [STAGE 1: Data Preparation](#📂-stage-1-data-preparation)
	- [Create Database and ERD](#create-database-and-erd)
- [STAGE 2: Data Analysis](#📂-stage-2-data-analysis)
	- [Annual Customer Activity Growth](#1-annual-customer-activity-growth)
	- [Annual Product Category Quality](#2-annual-product-category-quality)
	- [Analyze Annual Payment Type Usage](#3-analyze-annual-payment-type-usage)
- [STAGE 3: Business Recomendation](#📂-stage-3-business-recomendation)
<br>
<br>

---

## 📂 **STAGE 0: Problem Statement**

# Background Story
Mengukur performa bisnis merupakan suatu hal yang sangat penting bagi sebuah perusahaan. Ini akan membantu dalam memantau, dan menilai keberhasilan atau kegagalan dari berbagai proses bisnis. Pengukuran performa bisnis dapat dilakukan dengan memperhitungkan beberapa metrik bisnis. Dalam poyek ini akan dilakukan analisis performa bisnis suatu perusahaan eCommerce dengan dengan metrik bisnis yaitu pertumbuhan pelanggan, kualitas produk, dan tipe pembayaran.

### **Objective**
Mengumpulkan insight dari analisis dan dengan visualisasi berupa :
1. **Annual Customer Activity Growth**
2. **Annual Product Category Quality**
3. **Annual Payment Type Usage**
<br>
<br>

---

## 📂 **STAGE 1: Data Preparation**

Dataset yang digunakan adalah dataset sebuah perusahaan eCommerce Brasil yang memiliki informasi pesanan dengan jumlah 99441 dari tahun 2016 hingga 2018. Terdapat fitur-titur yang membuat informasi seperti status pemesanan, lokasi, rincian item, jenis pembayaran, serta ulasan.

### **Create Database and ERD**
**Langkah-langkah yang dilakukan meliputi:**
1. Membuat workspace database di dalam pgAdmin dan membuat tabel menggunakan `CREATE TABLE` statement
2. Melakukan import data csv kedalam database menggunakan `Copy` statement
3. Menentukan Primary Key atau Foreign Key menggunakan statement `ALTER TABLE`
4. Membuat dan mengeksport ERD (Entity Relationship Diagram) <br>

**Hasil ERD :** <br>
<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/d668a090-006f-48c7-83fb-7f33b700632d" width=600px> </kbd> <br>
  Gambar 1. Entity Relationship Diagram
</p>
<br>
<br>

---

## 📂 **STAGE 2: Data Analysis**

### **1. Annual Customer Activity Growth**
Pertumbuhan aktivitas pelanggan tahunan dapat dianalisis dari Monthly active user (MAU), pelanggan baru, pelanggan dengan repeat order, dan rata-rata order oleh pelanggan.

<p align="center">
  <img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/d82fa855-7f85-4f87-a41d-7164def384e0" > </kbd> <br>
  Table 1. Hasil Analisis Pertumbuhan Aktivitas Pelanggan Tahunan 
</p>

<br>
<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/e96e448b-05c6-4ac2-831d-44aaf12d2ae3" width=600px> </kbd> <br>
  Gambar 2. Grafik Rata-rata Monthly Active Users dan Pelanggan Baru
</p>

* Secara keseluruhan mulai dari monthly active users dan new customer mengalami kenaikan setiap tahunya sekitar 44% dari MAU dan 22% dari new customer hal ini terlihat bagus untuk perusahaan.
<br>
<br>

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/3cf1d313-67d2-4914-b7eb-5e499973a220" width=600px> </kbd> <br>
  Gambar 3. Grafik Jumlah Pelanggan yang Melakukan Repeat Order
</p>

* Jika dilihat dari repeat order yang dilakukan customer bisa dilihat pada grafik yang sudah disajikan terlihat tidak bagus karena kebanyakan customer hanya melakukan 1x pembelian setiap tahun nya, berdasarkan analisis line chart pada tahun 2017 ke 2018 itu mengalami penurunan pada customer yang melakukan repeat order. 

<br>

---
### **2. Annual Product Category Quality**

Kualitas kategori produk tahunan dapat dianalisis dari total pendapatan, total pembatalan pesanan, kategori top produk dan kategori produk yang paling banyak dibatalkan.

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/10b2bec1-ad03-424c-a155-0daca872f400" width=600px> </kbd> <br>
  Tabel 2. Hasil Analisis Total Kategori Produk Tahunan <br>
</p>

<br>
<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/d566b98b-1b1a-4acd-9539-acde92e48709" width=600px> </kbd> <br>
  Gambar 4. Grafik Total Revenue Pertahun
</p>

* Secara keseluruhan revenue perusahaan meningkat 22% setiap tahun. <br>
<br>
<br>

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/6bf4a3e8-34ad-4ff0-9509-8678003910f6" width=600px> </kbd> <br>
  Gambar 5. Grafik perbandingan delivered order dan cancel order
</p>

* Secara keseluruhan rasio pembatalan dibandingkan dengan total pembatalan dan jumlah pesanan yang berhasil order pertahun sangat kecil.
<br>

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/9a72c8d3-b546-4d8c-b075-9ab621edb211" width=600px> </kbd> <br>
  Gambar 6. Grafik Revenue yang dihasilkan category product
</p>
<br>

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/49d20134-7b83-4c62-8d19-fb53e8e61214" width=600px> </kbd> <br>
  Gambar 7. Grafik product yang paling banyak di cancel
</p>

* Insight yang bisa didapat tahun 2017 revenue terbanyak adalah bed bath table lalu berubah di tahun 2018 menjadi health beauty, category health beauty sangat mendominasi yang memiliki kontribusi untuk meningkatkan revenue perusahaan di tahun 2018 dibandingkan tahun lalu. meskipun demikian rasio pembatalan health beauty dibandingkan dengan total pembatalan per tahun dan jumlah pesanan yang berhasil order pertahun sangat kecil.
<br>

---

### **3. Analyze annual Payment Type Usage**
Tipe pembayaran yang digunakan pelanggan dapat dianalisis dari jenis pembayaran favorit dan jumlah penggunaan untuk setiap jenis pembayaran pertahun. 

<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/a0948588-4deb-4992-8cda-d5ea088ebfec" width=600px> </kbd> <br>
  Tabel 3. Hasil Analisis Tipe Pembayaran yang Digunakan Pelanggan <br>
</p>

<br>
<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/55888b94-0293-49b5-a302-06da213c696f" width=600px> </kbd> <br>
  Gambar 8. Grafik Ratio Tipe Pembayaran yang digunakan.
</p>

<br>
<p align="center">
  <kbd><img src="https://github.com/fauzanheryka/Data_Connector/assets/141212116/facaf716-58d0-46ef-b005-7ec35ec8ef11" width=600px> </kbd> <br>
  Gambar 9. Grafik Tipe Pembayaran yang sering  digunakan per tahun.
</p>

* Grafik diatas menunjukan credit card mengalami kenaikan yang lumayan sebesar 7% dari 2017 ke 2018 hal ini memungkinkan jika kedepanya credit card akan terus naik pengguna nya.

## 📂 **STAGE 3: Business Recomendation**
Berdasarkan beberapa analisis yang dilakukan, maka bisa memasukan beberapa rekomendasi bisnis :
1. Untuk meningkatkan new customer, maka bisa dilakukan click bait berupa discount berganda yang bisa diklaim Contohnya 
seperti “untuk customer baru mendapatkan discount 25%(10% new customer +15% untuk hot product) hal ini bisa terlihat
lebih menarik dibandingkan langsung menampilkan discount 25%. Karena banyak Masyarakat yang masih suka mengejar
dengan kuantitas discount yang banyak.
2. Untuk mempertahankan loyal customer agar bisa terus melakukan repeat order, maka bisa dilakukan gamifikasi dan 
memberi discount jika memenangkan tantangan sebesar 10%, hal ini perlu dilakukan untuk menunjukan bahwa platform 
yang digunakan bisa melakukan hal lain selain transaksi jual beli. 
3. Karena health beauty mendominasi penjualan, maka bisa lebih menargetkan segment pasar yang menyukai hal tersebut
dengan melakukan push notification.(karena keterbatasan data yang dimiliki tidak bisa melakukan segmented target secara 
on point maka untuk kedepanya diharapkan menambahkan tipe customer seperti gender, umur,).
4. Credit card memiliki pengguna yang banyak sekitar 73%, jadi bisa dilakukan kerja sama pada credit card untuk memberi
discount khusus bagi para pengguna credit card.
