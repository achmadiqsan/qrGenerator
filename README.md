# qrGenerator
QR Generator API Google With Delphi 7

Now I must confess this is using the Google Charts API, but it does demonstrate a quick and easy way to get QR barcodes in a Delphi or Lazarus/FreePascal application.

The API requires 3 simple fields be posted to it:

cht=qr this tells Google to create a QR code;
chld=M the error correction level of the QR code (see https://en.wikipedia.org/wiki/QR_code#Error_correction for more info);
chs=wxh the width and height of the image to return (eg chs=250x250);
chl=text the URL encoded text to be inserted into the barcode.

Sekarang saya harus mengakui bahwa ini menggunakan Google Charts API, tetapi ini menunjukkan cara yang cepat dan mudah untuk mendapatkan kode batang QR di aplikasi Delphi atau Lazarus/FreePascal.

API membutuhkan 3 bidang sederhana yang diposting ke sana:

cht=qr ini memberi tahu Google untuk membuat kode QR;
chld=M tingkat koreksi kesalahan kode QR (lihat di sini untuk info lebih lanjut);
chs=wxh lebar dan tinggi gambar yang akan dikembalikan (mis. chs=250x250);
chl=teks teks yang disandikan URL untuk dimasukkan ke dalam kode batang.

![Screenshot (11)](https://github.com/achmadiqsan/qrGenerator/assets/57186921/0a975bad-0cc1-4d7b-9150-e4be503c9f0a)

There are slight variations in the Delphi and Lazarus/FreePascal versions due to Delphi's handling of PNG images, the Delphi demo was created using Delphi 7 which requires an additional package and some extra lines to handle PNG images.

Ada sedikit variasi dalam versi Delphi dan Lazarus/FreePascal karena Delphi menangani gambar PNG, demo Delphi dibuat menggunakan Delphi 7 yang memerlukan paket tambahan dan beberapa baris tambahan untuk menangani gambar PNG.
