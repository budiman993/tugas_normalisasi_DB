CREATE DATABASE spbu_online;
USE spbu_online;

CREATE TABLE tbl_data_spbu(
id_spbu INT PRIMARY KEY AUTO_INCREMENT,
logo_spbu TEXT,
nama_spbu VARCHAR(50),
alamat_spbu VARCHAR(100),
no_telp VARCHAR(12),
stat BOOLEAN
);

CREATE TABLE tbl_jabatan(
id_jabatan INT PRIMARY KEY AUTO_INCREMENT,
nama_jabatan VARCHAR(50),
stat BOOLEAN
);

CREATE TABLE tbl_bank(
id_bank INT PRIMARY KEY AUTO_INCREMENT,
nama_bank VARCHAR(50),
kode_bank INT(3),
stat BOOLEAN
);

CREATE TABLE tbl_karyawan(
id_karyawan INT PRIMARY KEY AUTO_INCREMENT,
id_jabatan INT,
nik INT UNIQUE,
nama_karyawan VARCHAR(50),
alamat VARCHAR(100),
no_hp VARCHAR(12),
email VARCHAR (30) UNIQUE,
user_name VARCHAR (20) UNIQUE,
pass BINARY(15),
id_bank INT,
nama_bank VARCHAR(30),
stat BOOLEAN,
CONSTRAINT FOREIGN KEY (id_jabatan) REFERENCES tbl_jabatan(id_jabatan),
CONSTRAINT FOREIGN KEY (id_bank) REFERENCES tbl_bank(id_bank)
);

CREATE TABLE tbl_tangki(
id_tangki INT PRIMARY KEY AUTO_INCREMENT,
nama_tangki VARCHAR(50),
kapasitas INT(8),
keterangan TEXT,
stat BOOLEAN
);

CREATE TABLE tbl_pompa(
id_pompa INT PRIMARY KEY AUTO_INCREMENT,
nama_pompa VARCHAR(50),
id_tangki INT,
keterangan TEXT,
stat BOOLEAN,
CONSTRAINT FOREIGN KEY (id_tangki) REFERENCES tbl_tangki(id_tangki)
);

CREATE TABLE tbl_produk(
id_produk INT PRIMARY KEY AUTO_INCREMENT,
nama_produk VARCHAR(50),
harga INT,
stok INT
);

CREATE TABLE tbl_stasiun_pemasok(
id_pemasok INT PRIMARY KEY AUTO_INCREMENT,
nama_pemasok VARCHAR(50),
no_telp VARCHAR(12),
alamat VARCHAR(100),
id_bank INT,
no_rek VARCHAR(20),
stat BOOLEAN,
CONSTRAINT FOREIGN KEY (id_bank) REFERENCES tbl_bank(id_bank)
);


CREATE TABLE tbl_pelanggan(
id_pelanggan INT PRIMARY KEY AUTO_INCREMENT,
nik INT UNIQUE,
nama_pelanggan VARCHAR(50),
alamat VARCHAR(100),
no_hp VARCHAR(12),
email VARCHAR (30) UNIQUE,
pertamina_poin INT,
stat BOOLEAN
);

CREATE TABLE tbl_transaksi(
id_transaksi INT PRIMARY KEY AUTO_INCREMENT,
waktu_transaksi TIMESTAMP,
id_pompa INT,
id_produk INT,
jumlah INT,
CONSTRAINT FOREIGN KEY (id_pompa) REFERENCES tbl_pompa(id_pompa),
CONSTRAINT FOREIGN KEY (id_produk) REFERENCES tbl_produk(id_produk)
);

