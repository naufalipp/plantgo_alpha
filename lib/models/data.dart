import "package:plantgo_alpha/models/class.dart";

class Data {
  static List<Tanaman> tanaman = [
    Tanaman(
        id: '1',
        title: 'Sawi Hidroponik',
        image: "assets/images/sawi0.jpg",
        icon: "assets/images/iconsawi.png",
        steps: [
          Steps(
              no: 1,
              step:
                  'Siapkan alat dan Bahan : 1.Rockwoll, 2.Sprayer/Penyemprot Air, 3.Pinset, 4.Benih Sawi',
              imageSteps: ''),
          Steps(
              no: 2,
              step:
                  'Siapkan media tanam, potong rockwool setebal 2,5 cm. Iris memanjang sedalam kurang lebih 1 cm menjadi 3 bagian dan iris melintang menjadi 6 bagian sedalam 1 cm. Lihat gambar di bawah ini untuk detailnya.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2'),
          Steps(
              no: 3,
              step:
                  'Masukkan benih ke dalam lubang dengan posisi kecambah di bawah (1 lubang diisi 1 benih)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2'),
          Steps(
              no: 4,
              step:
                  'Setelah semua lubang terisi, basahi rockwool menggunakan sprayer/semprotan dengan kekuatan air yang lembut. Taruh semaian di tempat terbuka yang cukup sinar matahari.',
              imageSteps: ''),
          Steps(
              no: 5,
              step:
                  'Pada tahap ini adalah tahap perawatan semai, jaga rockwool agar tetap lembab (tidak terlalu basah dan tidak terlalu kering)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2'),
          Steps(
              no: 6,
              step:
                  'Setelah sawi berdaun 3 atau lebih, sudah waktunya untuk dipindah ke sistem hidroponik dan diberi nutrisi hidroponik. Umur sawi sekitar 7-10 hari setelah semai.',
              imageSteps: ''),
          Steps(
              no: 7,
              step:
                  'Step ini adalah tahap pindah tanam. Pisahkan/potong rockwool berdasarkan irisan yang dibuat pada step awal. Apabila susah untuk memisahkan rockwool, maka bisa menggunakan cutter untuk memotong rockwool sampe terpisah. Taruh potongan rockwool ke dalam netpot yang sudah dikasih flanel (sumbu)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2'),
          Steps(
              no: 8,
              step:
                  'Letakkan netpot ke dalam sistem hidroponik, pada tahap ini nutrisi yang diberikan kepekatannya 600 ppm. Kepekatan nutrisi dinaikkan setelah masuk 5 hari setelah pindah tanam menjadi 800 ppm. Setelah memasuki 10 hari setelah tanam, naikkan kepekatan nutrisi menjadi 1200 ppm. Jaga ppm nutrisi selalu stabil di angka tersebut sampai panen.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'),
          Steps(
              no: 9,
              step:
                  'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
              imageSteps: ''),
        ],
        tools: [
          Tools(
              name: 'Rockwoll',
              imageUrl:
                  'https://cf.shopee.co.id/file/6ae804b753a559ecce3b4417394e35cc'),
          Tools(
              name: 'Penyemprot air',
              imageUrl:
                  'https://media.tractorsupply.com/is/image/TractorSupplyCompany/4428569?'),
          Tools(
              name: 'pinset',
              imageUrl:
                  'https://ecs7.tokopedia.net/img/cache/700/product-1/2018/6/4/2594958/2594958_ca44b23f-6f46-4faf-ad33-4fc3c17771c6_1100_1100.jpg'),
          Tools(
              name: 'Benih Sawi',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3duaQUIV_r9CDX1fNvGB_YawVl9lfTNGED7TCd3oIfg-BWpPmlv1doI1vhaVZQnq2LXlKdtKNTGgC-DVUAy4lfcayAXujpJCxkm3MIAs8fuHJm6swNpDaMgzYy9ZvNzhCXOiQRzuyezXlOBHdUYubxX=s645'),
          Tools(
              name: 'Pot',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3dCrO47MheNdE6MkORPGHg0WtpseSld8UcniYUxmzGqj3ZKnvaZx9gY2hQchtFEqGGSpgGn15EKuPN5_EUeB7AreoP0XaYcpWvhJgqZOigXvA1a94QAAc2pozKZyjVE-7HX14tCWXcHecUZA5o7fB1y'),
        ],
        color: 0xFFD3EB91,
        videoUrl: 'https://www.youtube.com/watch?v=74tHX6PzkMU',
        hama: [
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/ACtC-3dn1waixMK8hEZM6dKA71lcSwO8eymmmvaSdnfSEUT7v4RcE2VynLU15goa9xlgU0fF2cZcPz7FQjEDy7v4x-0G_-EEO-UgUC8UoaCGjwF8SU2-FlVcswYeojEkEEfeCq83Nfg9cB6vHe9cSGyc8SeD=w800-h509-no?authuser=2',
              namehama: 'Hama Perusak Daun (Plutella xylostella)',
              desc:
                  'Plutella xylostella atau hama perusak daun termasuk jenis hama nokturnal yang aktif di malam hari, sedangkan di siang hari hama ini bersembunyi di bawah permukaan daun atau sisa tanaman. Ciri-ciri hama ini yaitu berwarna hijau dengan panjang sekitar 8 mm. Ulat Plutella merusak tanaman sawi dengan cara memakan daun sehingga daun berlubang dan menyisakan urat daun, terdapat bercak-bercak putih seperti jendela menerawang pada daun. Hama ini biasanya banyak berkembang dan menyerang tanaman sawi pada musim kemarau dan menyerang tanama muda.'),
          Hama(
            imagehama:
                'https://lh3.googleusercontent.com/pw/ACtC-3fL43VLMOAuyyfGtF3yCx4q01f6ZytzaKgaspj8XIHM9hmf-xQ2dzhlnwBs8whiMzBM8Kozp2aEjjzeBnkT0k2PxauuQ8c7QkaaiSF3S35GKSe5t8WX3sRE9r3Kf9lv52MepM5pT4UQWO77GFdr2tJf=w768-h511-no?authuser=2',
            namehama: 'Hama Penggorok Daun (Liriomyza sp)',
            desc:
                'Hama penggorok daun sering disebut hama leaf miner. Hama ini termasuk jenis lalat bibit yang hidup dan makan di dalam daun sawi. Larva atau ulat lalat bibit memakan daun sehingga terbentuk seperti lubang gerekan atau terowongan di dalam jaringan daun. Daun sawi yang terserang hama ini akan menguning, layu dan mati. Pengendalian hama penggorok daun dengan cara : Melakukan sanitasi lahan dan memangkas daun yang yang terserang dan Menggunakan insektisida nabati seperti minyak mimba',
          )
        ]),
    Tanaman(
        id: '2',
        title: 'Selada Hidroponik',
        image: "assets/images/selada-hidroponik.jpg",
        icon: "assets/images/iconselada.png",
        steps: [
          Steps(
              no: 1,
              step:
                  'Siapkan alat dan Bahan : 1.Benih Selada, 2.Pot, 3.Kain Flanel, 4.Nutrisi AB Mix, 5.Tandon Air Nutrisi, 6.Air Sumur, 7.Rockwool',
              imageSteps: ''),
          Steps(
            no: 2,
            step:
                'Benih selada disemai terlebih dahulu menggunakan wadah/mangkuk, isi wadah/mangkuk tersebut dengan air biasa kemudian basahi media hingga benar – benar basah, masukkan benih-benih selada ke dalam wadah/mangkuk berisi air tersebut,tunggu 12-24 jam hingga benih pecah.',
            imageSteps: '',
          ),
          Steps(
            no: 3,
            step:
                'Tahap penyemaian selanjutnya yaitu menempatkan benih di dalama rockwoll yang sudahdi iris dengan ukuran sekitar 2,5 x 2,5 x 2,5 cm dan dilubangi dengan keedalaman 1 cm, letakan rockwoll pada baki basahai rockwoll dengan air dan taruh di teeempat yang terkena sinar lalu tunggu 10 hari. ',
            imageSteps:
                'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2',
          ),
          Steps(
            no: 4,
            step:
                'Siapkan tandon, larutan nutrisi, sumbu dan media tanam. Sumbu (Kain fanel) dipasang pada pot/net dengan panjang, sumbu disesuaikan dengan kedalaman tandon. Usahakan menyentuh dasar tandon,',
            imageSteps:
                'https://lh3.googleusercontent.com/pw/AM-JKLVL1uCOuzd3UtWkz588Ta83lJZbHmx0ckEI2_UGJdIZsF1dzIQuLViT81z4y69-Qam57jvMzcfX0LAOEQnK4AXAZurCc0t46y5hSk03bojh2JEVPICUpgfIFkm2I_ULB7oI33rR5OWLyXUugVpe34dO=w933-h700-no?authuser=2',
          ),
          Steps(
              no: 4,
              step:
                  'Setelah mencapai usia 10 hari, saatnya pemindahan ke sistem hidorponik yang sebelumnya telah kita buat, Masukkan rockwool tersebut pada netpot.pastikan bahwak rockwool menyentuh kain flanel.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVfFbb1pi8KpvdQoX-mm01JvWXNvYA72wonAtPqX-KV-KR3UXFOCXA5Nz9pjGiT3cS22OHFz4QlTZB-7ZyaYnYzrIasK4e44OfcelOK5IK7IG76-q1kUKPTVgcMGlBIkhSd_cBSnP6CDNT136oPFvPT=w371-h450-no?authuser=2'),
          Steps(
            no: 5,
            step:
                'Isi bak sistem hidroponik dengan air nutrisi 500 ppm. Jumlah ini setara dengan 2,5 liter nutrisi A dan B serta 1 liter air. (Nilai ini dipertahankan hinga 12 HST). Letakan selada hidroponik yang baru ditanam pada tempat yang teduh selama 2-3 hari supaya beradaptasi terlebih dahulu,',
            imageSteps: '',
          ),
          Steps(
              no: 6,
              step:
                  'Selanjutnya perkenalkan dengan sinar matahari secara bertahap, jika cuaca terlalu panas, letakan selada hidroponik di bawah naungan paranel.',
              imageSteps: ''),
          Steps(
            no: 7,
            step: 'Setelah 12 HST naikkan kadar kepekatan menjadi 1000 ppm.',
            imageSteps: '',
          ),
          Steps(
            no: 8,
            step:
                'Setelah memasuki 20 HST naikkan kadar kepekatan menjadi 1200 ppm. Nilai ini tetap hingga masa panen tiba.',
            imageSteps:
                'https://lh3.googleusercontent.com/pw/AM-JKLWajvvhZUJ654fQ4Ea5fB8ECNxF2baPsfCIqsHb6FaZcea5KvKG0pzjnzS46WdUPYc2JUOphQoZvoSiyZk7QSHKdPCtcs8rUw-6vkztDiWl7ATgWK8Y_dvLvxJMo0IzS8fp-rK4xvbCwMKMoUDsKP6k=w800-h534-no?authuser=2',
          ),

          Steps(
              no: 9,
              step:
                  'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXTEBqUhkMvyqzj6S5NnLIvO8XuCyyZ1xpI9zUFs3Fp7SlBPilPte8JYhe0W2CXuUY6ApgqCLDEJzle8-qEBaBbeZzRpeR-5C6uMCHEwaBXtptZjPjV1qD2PREmWyJ7e7Jfu4hiTT-wqWgUUWyUqMse=w585-h387-no?authuser=2'),

          //'1. Diawal tanam (umur 1-7 hst) gunakan larutan nutrisi hidroponik doisis rendah, yaitu 500 PPM (setara dengan 2,5 ml nutrisi A + 2,5 nutrisi B + 1 liter air)'
          //'2. Memasuki minggu ke dua (umur 8-14 hst) naikan dosis nutrisi selada hidroponik menjadi 700 PPM ( setara dengan 3,5 ml nutrisi A + 3,5 nutrisi B + 1 liter air)'
          //'3. Minggu ke tiga (umur 15-21 hst) ) naikan dosis nutrisi selada hidroponik menjadi 900 PPM ( setara dengan 4,5 ml nutrisi A + 4,5 nutrisi B + 1 liter air)'
          //'4. Minggu ke empat (22 hst - panen) ) dosis nutrisi selada hidroponik sama dengan dosis nutrisi minggu ke tiga ( setara dengan 4,5 ml nutrisi A + 4,5 nutrisi B + 1 liter air).',
          //'Selada hidroponik siap panen umur 23 hst, sejak bibit selada dipindah tanam hingga bisa dipanen, jika di hitung dari pindah tanam umur selada hidroponik ini hanya 23 hari, tetapi sejak di hitung sejak benih disemai umur panen selada hidroponik adalah 58 hari.'
        ],
        tools: [
          Tools(
              name: 'Rockwoll',
              imageUrl:
                  'https://cf.shopee.co.id/file/6ae804b753a559ecce3b4417394e35cc'),
          Tools(
              name: 'Benih Selada',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3fzb-tQFPfkkO1we8ZGzM6tx9NY-fRa3mu2KPUWLdkmyRxEruZ4C8qdJTtt537_5tynNNJOErfvW20YFMlQg_O2uBi1CyEVRFTQFUDxcPOUq-AWkqqrI5F47wTaKvPjcomiZZ4O0acHX2iF9lRsmSan'),
          Tools(
              name: 'Pot',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3dCrO47MheNdE6MkORPGHg0WtpseSld8UcniYUxmzGqj3ZKnvaZx9gY2hQchtFEqGGSpgGn15EKuPN5_EUeB7AreoP0XaYcpWvhJgqZOigXvA1a94QAAc2pozKZyjVE-7HX14tCWXcHecUZA5o7fB1y'),
          Tools(
              name: 'Kain Flanel',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVxZzgG3E8SYKm4QYDdnlKLhSS-h-MwvgJy7Ey2_j4d3gaBWJjbmmGTdCrFfZbVAE3_Z9FZV9PNEBgHXWZuIuwSOR6rpr6-RkhQgnL_i86jgtJeSlxBM6AhKmHQ0CQbT2JTKYSqf4FChjSJM4suVCB4=s500-no?authuser=2'),
          Tools(
              name: 'Nutrisi AB Mix',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3ckv5bLgg6xfcXfxx-32re_tnAEAje8SBcjF1uwMBUcT3dgEVC2BfRj0gTAbL4fd1EKM40kEyqeve1oyp5xGbfjatFBJ1oCjJrz89hRoGGk3_bgzDj4XWkH_0mrSUGjJINf84u8Xn_uX2jMPQF-oN-0=s866-no?authuser=2'),
          Tools(
              name: 'Tandon Air Nutrisi',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLWXsNOZyonDSa95oeMVBW6bfeX4WMFWYJucCt9GUidAOv2AkutUzilDVPWsqAzlG828reXz_Oj4QmXmH8LOO6YHP06Mbbennt-3NsuaOGDKv9nqX6N7YV-dTyXk9wr9Wa6Jw3Mbq-S75t6F6kbUXuuM=w933-h700-no?authuser=2'),
        ],
        color: 0xFFFFD1A6,
        hama: [
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXVL3TLA3N8wa_yPqIwLdLyrhotq0SVhdeUOWcCgj20xdZQLInDJHYZFpvGSnyO027Qy7fIUZ7Mpu_PWnharSLVKSfHqmu-x_tojIw9FQhC5RlKQwFbxxWJDRxknYec1jqnaTOhqaIKmnElJp0Mrsdq=w800-h502-no?authuser=2',
              namehama: 'Hama Kutu Daun',
              desc:
                  'Hama Kutu Daun menyerang dan akan menyebabkan daun menjadi mengerut, kemudian mengering akibat kurang cairan. Bahaya jika tanaman selada yang masih berusia muda yang terserang. Maka akan mengganggu pertumbuhannya, tumbuh kerdil atau tidak sempurna. Untuk mengendalikan pada hama ini yaitu dengan menggunakan insektisida sesuai dengan dosis yang dianjurkan.'),
          Hama(
            imagehama:
                'https://lh3.googleusercontent.com/pw/AM-JKLWw-2Etmb8ufUDW62osqOXbTSL_J0WKjFCa4foneYPqTrEKoN7oDysNC4_LqbsQuk1xOGxXCsK7SS49V8-0qWyv6Ym_LusaNYiyYOlVLoUs46TVOLKU6vvJodDcLopZTfN3pR1s1xyGW5WnK6p9OE09=w440-h203-no?authuser=2',
            namehama: 'Penyakit Pangkal Daun',
            desc:
                'Penyakit ini busuk pangkal daun dapat disebabkan oleh bakteri Felicularia filamentosa, yang mana penyakit jenis ini dapat menyerang pada bagian pangkal daun ketika mendekari musim panen. Cara agar dapat mengendalikan penyakit busuk pangkal daun ini adalah dengan cara melakukan penyemprotan pestisida buatan atau pestisida alami.',
          )
        ]),
    Tanaman(
        id: '3',
        title: 'Kangkung Hidroponik',
        image: "assets/images/kangkung-bg.jpg",
        icon: "assets/images/iconkangkung.png",
        tools: [
          Tools(
              name: 'Besek Plastik',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUSY4VXv9U-jS_CBOtaaejz0rajn7bv1KvCebM2oU1cj3Jqpuk3wbrxhVL-0WrkASI6YwSQYitC07cdZrOoScOLa4LclOcmcj5meTkONFhDqBfIBPbb0JNBzUCVu8xHlTUvBiqUv27noWEoooQ46aiw=w700-h465-no?authuser=2'),
          Tools(
              name: 'Benih Kangkung',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLW91uOuOjJC8R_9a1rsyqEeUkv98B2WkdPWW9IIJCl_zmAQpOD0erZAzoCkz85vgP0zqnCy27C6wld6Y_CexuLm0WBEdvoVoe5c304i9YIrQs2z-GptF-bVW-9EwesD-QZiq6KiW6CaT42ppWt1bBCr=s800-no?authuser=2'),
          Tools(
              name: 'Nutrisi AB Mix',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3ckv5bLgg6xfcXfxx-32re_tnAEAje8SBcjF1uwMBUcT3dgEVC2BfRj0gTAbL4fd1EKM40kEyqeve1oyp5xGbfjatFBJ1oCjJrz89hRoGGk3_bgzDj4XWkH_0mrSUGjJINf84u8Xn_uX2jMPQF-oN-0=s866-no?authuser=2'),
          Tools(
              name: 'Baskom',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUIZ1o6dKU9Fz7ypko1xwkPHFeNK2nmyiF78jmrW4ZGfVZN9qltPzy2smC1eOdyYFjckHOYnr-n4OumSQwUqacaPGrkZicJ9tOFMuyy0DH4Whs2HiYt02IBPgw27-mQMNBI6FtZjKRk38Vm494_AEKw=s700-no?authuser=2'),
        ],
        steps: [
          Steps(
              no: 1,
              step:
                  'Siapkan alat dan Bahan : 1.Benih Kangkung, 2.Nutrisi Hidroponik, 3.Besek Pelastik, 4.Baskom yang berdiameter sedikit lebih kecil dari Besek agar tidak tenggelam',
              imageSteps: ''),
          Steps(
              no: 2,
              step:
                  'Langkah pertama yaitu dengan menyemai benih kangkung, Pertama Ambil baskom yang sudah diisi air kemudian taruh besek diatasnya',
              imageSteps: ''),
          Steps(
              no: 3,
              step:
                  'Masukkan benih ke dalam besek, taburkan hingga merata. Jangan terlalu banyak atau sedikit. Bila lubang-lubang besek lebih besar dari pada benih, bisa tambahkan tisu pada dasar besek. Sebelum ditabur benih juga dapat di rendam beberapa jam terlebih dulu.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLW69ubASp6cCfINmU9H4dmJHVtIVAOyFuO3z4uSOeCf5lPmwT4UZNdEz78QNGuZ_qFwa_JAJElYPzAe2wg4UWxS4zl8OQ3FCnX6o0YKncgWTxrOKslw606_1wQmjhF1Dxl0TFiQAVdsxMk3-g60yvlG=w1281-h721-no?authuser=2'),
          Steps(
              no: 4,
              step:
                  ' Taruh baskom di tempat yang teduh hingga benih berkecambah kemudian jemur dibawah matahari.',
              imageSteps: ''),
          Steps(
              no: 5,
              step:
                  'Pada tahap ini adalah tahap perawatan dengan pemberian nutrisi hidroponik AB Mix dan jangan sampai telat, cara menggunakannya yaitu Siapkan air baku sebanyak yang dibutuhkan sesuai dengan tabel pemakaian nutrisi. Biasanya menggunakan perbandingan 1 : 5 : 5, dan berlaku kelipatan. Tambahkan stok A dan stok B kemudian aduk hingga tercampur. Lalu nutrisi yang sudah tercampur ditambahkan pada baskom',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLV1S6Gvwc_cE3YW0m-ZWju-WqfD-fARQXS6qKbkA701ofwo7qKPnbz6lgXvAEVgUmd-BzlthvVlIdd74CEkQkRokkhJhCDB9SfVnfUOftVP6w_CNhs3P_FMJtIdBhYjJoYKfixY7AztL8BKMS-7_VOW=s866-no?authuser=2'),
          Steps(
              no: 6,
              step:
                  'Pada tahap perawatan kangkung sudah memasuki umur 2 minggu, berarti harus dilakukan penambahan nutrisi. Kamu harus menambah jumlah nutrisi yang awalnya hanya 5 ml per 1 liter, sekarang menjadi 10 ml per 1,5 liter.',
              imageSteps: ''),
          Steps(
              no: 7,
              step:
                  'Setelah berumur 21 – 25 hari dan memiliki ciri – ciri tanaman yang sudah bisa dipanen, maka kangkung siap dipanen. Cara panennya  ada 2 macam, yaitu dengan mencabut langsung sampai akarnya ikut (mati). Atau dengan memotong 2/3 bagian batang atas, dan beri nutrisi lagi maka dia akan tumbuh lagi. ',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUue7sgdkiNN0TSvp3izG-WGiFCtb-w3FxTfjcje57B52oX5kv9qx_LtRmddex4FNtkxHdKdvVIMGOjpVcMgpd29hi708OnUqToo3FTWFBTBWVqfdc0zsBASg06-Z4jCPJJ7XX_X4hOuzEoTp2kpcGb=w770-h413-no?authuser=2'),
        ],
        color: 0xFFB3D054,
        hama: [
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXJ_nHNb3u9Jvh3w5kuSHbaIvFK41rf6onuinfzmDhDjKgj2o97r6OfobBLp6NJe78fV-lCrgFaBH78v5w8ONkSBYm5VmYBAN8CjeaGCZVcReE7y3kGIV13NIqWDFPMVauTfZl7wEV5tgIMN4X-1O-1=w720-h960-no?authuser=2',
              namehama: 'Karat Putih',
              desc:
                  'Pada daun dewasa terdapat bercak kuning dengan bentuk dan ukuran yang tidak tentu, biasanya lebih dahulu terlihat di bawah permukaan daun. Pengndaliannya yaitu dengan Melakukan sanitasi kebun, penyiraman teratur dan perawatan baik dan bisa dngan melakukan penyemprotan Dithane M-45 atau Benlate sesuai dengan petunjuk.'),
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXVL3TLA3N8wa_yPqIwLdLyrhotq0SVhdeUOWcCgj20xdZQLInDJHYZFpvGSnyO027Qy7fIUZ7Mpu_PWnharSLVKSfHqmu-x_tojIw9FQhC5RlKQwFbxxWJDRxknYec1jqnaTOhqaIKmnElJp0Mrsdq=w800-h502-no?authuser=2',
              namehama: 'Hama Kutu Daun',
              desc:
                  'Hama Kutu Daun menyerang dan akan menyebabkan daun menjadi mengerut, kemudian mengering akibat kurang cairan. Bahaya jika tanaman selada yang masih berusia muda yang terserang. Maka akan mengganggu pertumbuhannya, tumbuh kerdil atau tidak sempurna. Untuk mengendalikan pada hama ini yaitu dengan menggunakan insektisida sesuai dengan dosis yang dianjurkan.'),
          Hama(
            imagehama:
                'https://lh3.googleusercontent.com/pw/AM-JKLXkeq6toA7E8_YP6kovwVj6oYn30rwnPmBDm89f4ToTzlmrLguLuKPugHMalgChn9V9q6tUm_EhVaVRfRgn_rQkXf_RcQnUuqu66fJDPdh6DD6lVGgsFU3iNkDPcevScxHyppx-XFyWM8qXXeprs4wa=w640-h480-no?authuser=2',
            namehama: 'Bercak daun',
            desc:
                'Gejalanya permukaan daun akan terdapat bercak berwarna kecoklatan hingga kehitaman, daun menjadi tidak abnormal dan juga rusak. Pengendaliannya yaitu dengan Melakukan pencabutan tanaman terserang dan memindahkan jauh dari tanaman lainnya, dan Melakukan penyemrotan tanaman terserang dengan Dithane M-45 sesuai dengan petunjuk.',
          )
        ]),
    Tanaman(
        id: '4',
        title: 'Bayam Hidroponik',
        image: "assets/images/bayambg.jpg",
        icon: "assets/images/iconbayam.png",
        tools: [
          Tools(
              name: 'Besek Plastik',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUSY4VXv9U-jS_CBOtaaejz0rajn7bv1KvCebM2oU1cj3Jqpuk3wbrxhVL-0WrkASI6YwSQYitC07cdZrOoScOLa4LclOcmcj5meTkONFhDqBfIBPbb0JNBzUCVu8xHlTUvBiqUv27noWEoooQ46aiw=w700-h465-no?authuser=2'),
          Tools(
              name: 'Benih Bayam',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXjLj0vBfupfp7h-FoYLr29CUsTTtw9D_GJQS74wML4rR-mPrT9nned9GvLPhoRf9zaWWzq0ksjhphNS0Eo3IB1jliDy6cr_mbPyYTj_crRnAzVXkwXdWBheucNnNrtyxtIvJfShxnNPFX8dqEpjT-2=s720-no?authuser=2'),
          Tools(
              name: 'Kain Flanel',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVuVFw6c-SPL9PhxOMA5VUAeO5H1RO-h-eMR73x9cQ42PRtTEXcmn3-vBxlKG6TPkmv4mNAYghKPad11VtBAeq00qFCv6fXhPY7BvAucMBKWZ8-AeTHM7_hgToUzHBUwzIVh2kDm-CUurxOnQakSuKa=s800-no?authuser=2'),
          Tools(
              name: 'Nutrisi AB Mix',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3ckv5bLgg6xfcXfxx-32re_tnAEAje8SBcjF1uwMBUcT3dgEVC2BfRj0gTAbL4fd1EKM40kEyqeve1oyp5xGbfjatFBJ1oCjJrz89hRoGGk3_bgzDj4XWkH_0mrSUGjJINf84u8Xn_uX2jMPQF-oN-0=s866-no?authuser=2'),
          Tools(
              name: 'Baskom',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUIZ1o6dKU9Fz7ypko1xwkPHFeNK2nmyiF78jmrW4ZGfVZN9qltPzy2smC1eOdyYFjckHOYnr-n4OumSQwUqacaPGrkZicJ9tOFMuyy0DH4Whs2HiYt02IBPgw27-mQMNBI6FtZjKRk38Vm494_AEKw=s700-no?authuser=2'),
        ],
        steps: [
          Steps(
              no: 1,
              step:
                  'Siapkan alat dan Bahan : 1.Benih Bayam, 2.Nutrisi Hidroponik AB Mix, 3.Besek Pelastik, 4.Baskom yang berdiameter sedikit lebih kecil dari Besek agar tidak tenggelam',
              imageSteps: ''),
          Steps(
              no: 2,
              step:
                  'Langkah pertama yaitu dengan menyemai benih bayam, Umumnya, penyemaian benih bayam ini termasuk cepat. Sehingga untuk bayam masuk ke tahap panen juga tidak membutuhkan waktu yang lama, kurang lebih 1 bulan.',
              imageSteps: ''),
          Steps(
              no: 3,
              step:
                  'Potong kain flanel sesuai bentuk bakul besek, lalu masukan kain tesebut kedalam besek dan basahi kain flanel yang sudah berada didalam besek',
              imageSteps: ''),
          Steps(
              no: 4,
              step:
                  'Taburi benih bayam sekitar 20 benih tau secukupnya ke bakul besek yang telah terisi oleh kain flanel. Setelah itu, isi baskom dengan air bersih dan taruh bakul besek diatas baskom, usahakan air mengenai permukaan kain flanel',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUQ_nyeQEDf31McwS0eXc8S0YyAYL3rCGKtpYcPhkxSYihsAvFg-Toubyd54bNzpv5H61h0a-ZMaBnpgRXKclkaqcvW0Lar06yS2U7Txv_yoDwCnAfgo91L2zFyH0wQaT0xHb8qIYZjt0Y1B_2KvmoW=w1184-h790-no?authuser=2'),
          Steps(
              no: 5,
              step:
                  'Setelah proses tersebut sudah dilakukan, pindahkan media tanam di tempat gelap. Dalam waktu 3 hari, nantinya benih akan pecah dan tumbuh kecambah. Selama waktu 3 hari ini, kita harus rutin menyemprotkan air ke benih bayam, supaya tanaman cepat tumbuh dan tidak rusak.',
              imageSteps: ''),
          Steps(
              no: 6,
              step:
                  'Jika benih sudah pecah dan tumbuh kecambah, pindahkan media tanam ke tempat yang cukup terkena cahaya sinar matahari.',
              imageSteps: ''),
          Steps(
              no: 7,
              step:
                  'Bila tanaman bayam sudah memunculkan daun sekitar 5 helai, kita dapat mengganti isi ember dengan campuran air nutrisi AB mix.Caranya, cukup tuangkan nutrisi AB mix 1 botol ke dalam air yang terdapat di ember. Kemudian aduk merata, setelah itu letakkan kembali bakul nasi di atas ember tersebut. Pastikan kain flanel menyentuh air yang terdapat di ember.  ',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLX9DY32uIMoGUflMjIBIzVgd9lsZkOLfdXJBR_cX7r8SzblILG_0dVSGifvO3I2ZVS-aavqYD9zLo5XpDRsZBgdae1vJRlclv25jMk-H_GRZZkOnYNIQ_SMDvKFNxIa7_FtX-U_DGi9C2JZJKm8d067=w1174-h606-no?authuser=2'),
          Steps(
              no: 8,
              step:
                  'Bila bayam sudah tumbuh akar, pastikan akar selalu terkena air nutrisi AB mix supaya bayam cepat tumbuh. Selain itu, semprot tanaman bayam 2 kali sehari setiap pagi dan sore.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVZ-CMmCMSWY-MU_WyUWIipGWgRHkH9bqAknPSE_ScW1ePJD8A4RTiCqohg7_YcYXOS2cXNb3LacnaCFKeoppq_4FYIrUKb5L59tc3ovej9abF3_2h3JiHbNfx9PhHRZAmuNO-uga9bEvz9jc5Zsrkq=w1193-h600-no?authuser=2'),
          Steps(
              no: 9,
              step:
                  'Proses panen. Tanaman bayam termasuk cepat dalam menumbuhkan sayuran yang siap dikonsumsi. Bayam hanya membutuhkan waktu kurang lebih 1 bulan untuk sampai ke tahap panen setelah proses penanaman.Cara memanen tanaman bayam hidroponik dengan langsung mencabut bayam yang sudah tumbuh dengan hati – hati.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/AM-JKLWwlwKDCsaXwlGXVCSGDw31-RIvLZclSZf5NuwWfZ9O8pYYCDyAYUlvIpvQQPP78COBZEgS6goGVr9NJUZu2-hwk84xwHMgQnsz7DmEGIje561aX3_ebndmH9YdTTfPFupDTbHeOa0jcpiVQdAf5CYd=w1280-h720-no?authuser=2'),
        ],
        color: 0xFFFFF0AD,
        hama: [
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVDgQyT97jVXTeHPFVS_axuIdi-reRQsTq8C83IIbtzH4DZR8oKgoQwd1g_0GcD8pJv53XkWI-FG7oEEXtFNYuXk7UFP9mIHv7mODKnKOOr5fBoziNpdPB5XfdmJpnFGo334y71wio1ZJvLZIplXEL3=w896-h540-no?authuser=2',
              namehama: 'Spinach Blight',
              desc:
                  'Penyakit ini disebabkan oleh virus Mozaik yang akan mengubah daun tanaman bayam muda berubah warna menjadi warna kuning, serta menggulung. Pengendalian penyakit pada tanaman ini dapat dilakukan dengan mencabut dan memusnahkan daun bayam yang mengalami gejala tersebut. Selain itu, penyakit ini juga dapat dicegah dengan menjaga sanitasi kebun.'),
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXVL3TLA3N8wa_yPqIwLdLyrhotq0SVhdeUOWcCgj20xdZQLInDJHYZFpvGSnyO027Qy7fIUZ7Mpu_PWnharSLVKSfHqmu-x_tojIw9FQhC5RlKQwFbxxWJDRxknYec1jqnaTOhqaIKmnElJp0Mrsdq=w800-h502-no?authuser=2',
              namehama: 'Hama Kutu Daun',
              desc:
                  'Hama Kutu Daun menyerang dan akan menyebabkan daun menjadi mengerut, kemudian mengering akibat kurang cairan. Bahaya jika tanaman selada yang masih berusia muda yang terserang. Maka akan mengganggu pertumbuhannya, tumbuh kerdil atau tidak sempurna. Untuk mengendalikan pada hama ini yaitu dengan menggunakan insektisida sesuai dengan dosis yang dianjurkan.'),
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXJ_nHNb3u9Jvh3w5kuSHbaIvFK41rf6onuinfzmDhDjKgj2o97r6OfobBLp6NJe78fV-lCrgFaBH78v5w8ONkSBYm5VmYBAN8CjeaGCZVcReE7y3kGIV13NIqWDFPMVauTfZl7wEV5tgIMN4X-1O-1=w720-h960-no?authuser=2',
              namehama: 'Karat Putih',
              desc:
                  'Pada daun dewasa terdapat bercak kuning dengan bentuk dan ukuran yang tidak tentu, biasanya lebih dahulu terlihat di bawah permukaan daun. Pengndaliannya yaitu dengan Melakukan sanitasi kebun, penyiraman teratur dan perawatan baik dan bisa dngan melakukan penyemprotan Dithane M-45 atau Benlate sesuai dengan petunjuk.'),
        ]),
    Tanaman(
        id: '5',
        title: 'Tomat',
        image: "assets/images/tomato.jpg",
        icon: "assets/images/icontomat.png",
        tools: [
          Tools(
              name: 'Besek Plastik',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUSY4VXv9U-jS_CBOtaaejz0rajn7bv1KvCebM2oU1cj3Jqpuk3wbrxhVL-0WrkASI6YwSQYitC07cdZrOoScOLa4LclOcmcj5meTkONFhDqBfIBPbb0JNBzUCVu8xHlTUvBiqUv27noWEoooQ46aiw=w700-h465-no?authuser=2'),
          Tools(
              name: 'Benih Bayam',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXjLj0vBfupfp7h-FoYLr29CUsTTtw9D_GJQS74wML4rR-mPrT9nned9GvLPhoRf9zaWWzq0ksjhphNS0Eo3IB1jliDy6cr_mbPyYTj_crRnAzVXkwXdWBheucNnNrtyxtIvJfShxnNPFX8dqEpjT-2=s720-no?authuser=2'),
          Tools(
              name: 'Kain Flanel',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVuVFw6c-SPL9PhxOMA5VUAeO5H1RO-h-eMR73x9cQ42PRtTEXcmn3-vBxlKG6TPkmv4mNAYghKPad11VtBAeq00qFCv6fXhPY7BvAucMBKWZ8-AeTHM7_hgToUzHBUwzIVh2kDm-CUurxOnQakSuKa=s800-no?authuser=2'),
          Tools(
              name: 'Nutrisi AB Mix',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/ACtC-3ckv5bLgg6xfcXfxx-32re_tnAEAje8SBcjF1uwMBUcT3dgEVC2BfRj0gTAbL4fd1EKM40kEyqeve1oyp5xGbfjatFBJ1oCjJrz89hRoGGk3_bgzDj4XWkH_0mrSUGjJINf84u8Xn_uX2jMPQF-oN-0=s866-no?authuser=2'),
          Tools(
              name: 'Baskom',
              imageUrl:
                  'https://lh3.googleusercontent.com/pw/AM-JKLUIZ1o6dKU9Fz7ypko1xwkPHFeNK2nmyiF78jmrW4ZGfVZN9qltPzy2smC1eOdyYFjckHOYnr-n4OumSQwUqacaPGrkZicJ9tOFMuyy0DH4Whs2HiYt02IBPgw27-mQMNBI6FtZjKRk38Vm494_AEKw=s700-no?authuser=2'),
        ],
        steps: [
          Steps(
              no: 1,
              step:
                  'Siapkan alat dan Bahan : 1.Rockwoll, 2.Sprayer/Penyemprot Air, 3.Pinset, 4.Benih Sawi',
              imageSteps: ''),
          Steps(
              no: 2,
              step:
                  'Siapkan media tanam, potong rockwool setebal 2,5 cm. Iris memanjang sedalam kurang lebih 1 cm menjadi 3 bagian dan iris melintang menjadi 6 bagian sedalam 1 cm. Lihat gambar di bawah ini untuk detailnya.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2'),
          Steps(
              no: 3,
              step:
                  'Masukkan benih ke dalam lubang dengan posisi kecambah di bawah (1 lubang diisi 1 benih)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2'),
          Steps(
              no: 4,
              step:
                  'Setelah semua lubang terisi, basahi rockwool menggunakan sprayer/semprotan dengan kekuatan air yang lembut. Taruh semaian di tempat terbuka yang cukup sinar matahari.',
              imageSteps: ''),
          Steps(
              no: 5,
              step:
                  'Pada tahap ini adalah tahap perawatan semai, jaga rockwool agar tetap lembab (tidak terlalu basah dan tidak terlalu kering)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2'),
          Steps(
              no: 6,
              step:
                  'Setelah sawi berdaun 3 atau lebih, sudah waktunya untuk dipindah ke sistem hidroponik dan diberi nutrisi hidroponik. Umur sawi sekitar 7-10 hari setelah semai.',
              imageSteps: ''),
          Steps(
              no: 7,
              step:
                  'Step ini adalah tahap pindah tanam. Pisahkan/potong rockwool berdasarkan irisan yang dibuat pada step awal. Apabila susah untuk memisahkan rockwool, maka bisa menggunakan cutter untuk memotong rockwool sampe terpisah. Taruh potongan rockwool ke dalam netpot yang sudah dikasih flanel (sumbu)',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2'),
          Steps(
              no: 8,
              step:
                  'Letakkan netpot ke dalam sistem hidroponik, pada tahap ini nutrisi yang diberikan kepekatannya 600 ppm. Kepekatan nutrisi dinaikkan setelah masuk 5 hari setelah pindah tanam menjadi 800 ppm. Setelah memasuki 10 hari setelah tanam, naikkan kepekatan nutrisi menjadi 1200 ppm. Jaga ppm nutrisi selalu stabil di angka tersebut sampai panen.',
              imageSteps:
                  'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'),
          Steps(
              no: 9,
              step:
                  'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
              imageSteps: ''),
        ],
        color: 0xFFFFC4C0,
        hama: [
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLVDgQyT97jVXTeHPFVS_axuIdi-reRQsTq8C83IIbtzH4DZR8oKgoQwd1g_0GcD8pJv53XkWI-FG7oEEXtFNYuXk7UFP9mIHv7mODKnKOOr5fBoziNpdPB5XfdmJpnFGo334y71wio1ZJvLZIplXEL3=w896-h540-no?authuser=2',
              namehama: 'Spinach Blight',
              desc:
                  'Penyakit ini disebabkan oleh virus Mozaik yang akan mengubah daun tanaman bayam muda berubah warna menjadi warna kuning, serta menggulung. Pengendalian penyakit pada tanaman ini dapat dilakukan dengan mencabut dan memusnahkan daun bayam yang mengalami gejala tersebut. Selain itu, penyakit ini juga dapat dicegah dengan menjaga sanitasi kebun.'),
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXVL3TLA3N8wa_yPqIwLdLyrhotq0SVhdeUOWcCgj20xdZQLInDJHYZFpvGSnyO027Qy7fIUZ7Mpu_PWnharSLVKSfHqmu-x_tojIw9FQhC5RlKQwFbxxWJDRxknYec1jqnaTOhqaIKmnElJp0Mrsdq=w800-h502-no?authuser=2',
              namehama: 'Hama Kutu Daun',
              desc:
                  'Hama Kutu Daun menyerang dan akan menyebabkan daun menjadi mengerut, kemudian mengering akibat kurang cairan. Bahaya jika tanaman selada yang masih berusia muda yang terserang. Maka akan mengganggu pertumbuhannya, tumbuh kerdil atau tidak sempurna. Untuk mengendalikan pada hama ini yaitu dengan menggunakan insektisida sesuai dengan dosis yang dianjurkan.'),
          Hama(
              imagehama:
                  'https://lh3.googleusercontent.com/pw/AM-JKLXJ_nHNb3u9Jvh3w5kuSHbaIvFK41rf6onuinfzmDhDjKgj2o97r6OfobBLp6NJe78fV-lCrgFaBH78v5w8ONkSBYm5VmYBAN8CjeaGCZVcReE7y3kGIV13NIqWDFPMVauTfZl7wEV5tgIMN4X-1O-1=w720-h960-no?authuser=2',
              namehama: 'Karat Putih',
              desc:
                  'Pada daun dewasa terdapat bercak kuning dengan bentuk dan ukuran yang tidak tentu, biasanya lebih dahulu terlihat di bawah permukaan daun. Pengndaliannya yaitu dengan Melakukan sanitasi kebun, penyiraman teratur dan perawatan baik dan bisa dngan melakukan penyemprotan Dithane M-45 atau Benlate sesuai dengan petunjuk.'),
        ]),
  ];
}
