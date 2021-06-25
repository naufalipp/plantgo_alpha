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
            step: 'Siapkan alat dan Bahan : 1.Rockwoll, 2.Sprayer/Penyemprot Air, 3.Pinset, 4.Benih Sawi',
            imageSteps: ''
          ),
          Steps(
            no: 2,
            step: 'Siapkan media tanam, potong rockwool setebal 2,5 cm. Iris memanjang sedalam kurang lebih 1 cm menjadi 3 bagian dan iris melintang menjadi 6 bagian sedalam 1 cm. Lihat gambar di bawah ini untuk detailnya.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2'
          ),
          Steps(
            no: 3,
            step: 'Masukkan benih ke dalam lubang dengan posisi kecambah di bawah (1 lubang diisi 1 benih)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2'
          ),
          Steps(
            no: 4,
            step: 'Setelah semua lubang terisi, basahi rockwool menggunakan sprayer/semprotan dengan kekuatan air yang lembut. Taruh semaian di tempat terbuka yang cukup sinar matahari.',
            imageSteps: ''
          ),
          Steps(
            no: 5,
            step: 'Pada tahap ini adalah tahap perawatan semai, jaga rockwool agar tetap lembab (tidak terlalu basah dan tidak terlalu kering)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2'
          ),
          Steps(
            no: 6,
            step: 'Setelah sawi berdaun 3 atau lebih, sudah waktunya untuk dipindah ke sistem hidroponik dan diberi nutrisi hidroponik. Umur sawi sekitar 7-10 hari setelah semai.',
            imageSteps: ''
          ),
          Steps(
            no: 7,
            step: 'Step ini adalah tahap pindah tanam. Pisahkan/potong rockwool berdasarkan irisan yang dibuat pada step awal. Apabila susah untuk memisahkan rockwool, maka bisa menggunakan cutter untuk memotong rockwool sampe terpisah. Taruh potongan rockwool ke dalam netpot yang sudah dikasih flanel (sumbu)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2'
          ),
          Steps(
            no: 8,
            step: 'Letakkan netpot ke dalam sistem hidroponik, pada tahap ini nutrisi yang diberikan kepekatannya 600 ppm. Kepekatan nutrisi dinaikkan setelah masuk 5 hari setelah pindah tanam menjadi 800 ppm. Setelah memasuki 10 hari setelah tanam, naikkan kepekatan nutrisi menjadi 1200 ppm. Jaga ppm nutrisi selalu stabil di angka tersebut sampai panen.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'
          ),
              
          Steps(
            no: 9,
            step: 'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
            imageSteps: ''
          ),
          
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
        image: "assets/images/sawi1.jpg",
        icon: "assets/images/iconselada.png",
        steps: [
          Steps(
            no: 1,
            step: 'Siapkan alat dan Bahan : 1.Benih Selada, 2.Pot, 3.Kain Flanel, 4.Nutrisi AB Mix, 5.Tandon Air Nutrisi, 6.Air Sumur',
            imageSteps: ''
          ),
          Steps(
            no: 2,
            step: 'Benih selada disemai terlebih dahulu menggunakan polybag, nampan, keranjang, plastik atau wadah apasaja. Media semai gunkan yang tersedia, jika menggunakan arang sekam masukan arang sekam kedalam polybag atau wadah lainnya, kemudian basahi media hingga benar – benar basah, tanam benih selada satu persatu, 3-4 hari kemudian biasanya benih selada sudah tumbuh atau berkecambah. Benih selada bisa dipindah tanam ketika berumur 25-30 hari setelah semai.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2',
          ),
          Steps(
            no: 3,
            step: 'Siapkan tandon, larutan nutrisi, sumbu dan media tanam. Sumbu (Kain fanel) dipasang pada pot/net dengan panjang, sumbu disesuaikan dengan kedalaman tandon. Usahakan menyentuh dasar tandon,',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2',
          ),
          Steps(
            no: 4,
            step:  'Buka polybag semai dengan hati – hati jangan samapai akar bibit selada rusak atau putus. Masukan bibit kedalam pot dengan media tanam hingga penuh, buat larutan nutrisi hidroponik secukupnya dengan dosis rendah jika bibit seladamsudah ditanam pot, letakan pot pada tandon.',
            imageSteps: ''
          ),
          Steps(
            no: 5,
            step: 'Letakan selada hidroponik yang baru ditanam pada tempat yang teduh selama 2-3 hari supaya beradaptasi terlebih dahulu,',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2',
          ),
          Steps(
            no: 6,
            step: 'selanjutnya perkenalkan dengan sinar matahari secara bertahap, jika cuaca terlalu panas, letakan selada hidroponik di bawah naungan paranel.',
            imageSteps: ''
          ),
          Steps(
            no: 7,
            step: 'Jarak tanam untuk selada hidroponik yaitu 25 x 25 cm atau 25 x 30 cm',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2',
          ),
          Steps(
            no: 8,
            step:  'Dosis PPM Larutan Nutrisi untuk Selada Hidroponik',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'
          ),
              
          Steps(
            no: 9,
            step: 'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
            imageSteps: ''
          ),
          
      
              //'1. Diawal tanam (umur 1-7 hst) gunakan larutan nutrisi hidroponik doisis rendah, yaitu 500 PPM (setara dengan 2,5 ml nutrisi A + 2,5 nutrisi B + 1 liter air)'
              //'2. Memasuki minggu ke dua (umur 8-14 hst) naikan dosis nutrisi selada hidroponik menjadi 700 PPM ( setara dengan 3,5 ml nutrisi A + 3,5 nutrisi B + 1 liter air)'
              //'3. Minggu ke tiga (umur 15-21 hst) ) naikan dosis nutrisi selada hidroponik menjadi 900 PPM ( setara dengan 4,5 ml nutrisi A + 4,5 nutrisi B + 1 liter air)'
              //'4. Minggu ke empat (22 hst - panen) ) dosis nutrisi selada hidroponik sama dengan dosis nutrisi minggu ke tiga ( setara dengan 4,5 ml nutrisi A + 4,5 nutrisi B + 1 liter air).',
          //'Selada hidroponik siap panen umur 23 hst, sejak bibit selada dipindah tanam hingga bisa dipanen, jika di hitung dari pindah tanam umur selada hidroponik ini hanya 23 hari, tetapi sejak di hitung sejak benih disemai umur panen selada hidroponik adalah 58 hari.'
        ],
        tools: [
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
                  'https://lh3.googleusercontent.com/lrqEWYHzFu684zAheYqUbb3UyJRLHVEwKFf6Zj8BrKOkknQQPvhh0D8GKu-zG6Mtd7e9Q-OEJfvoAdJK5AMqFHpzEy3n4ZAMyKd7laGf10iGTpxOdOcc0obKMUa0TiT70AU0tumowEYoseLc4fhqGA7-yrYhQzAyCcXrti67MGUAGl-pYtiBbsWFjFb2CLThdhq4LrM-oUbQobDuJcIUT4Rxk0GeY-hPGVwTU5VwXcld6oBw9ex2FsUvrG6K7_J380hQXdlY_4S6MQdcNnoRnJ85INozRpkU4xTnBWPgIpmz_wDq5-HYZUsocKj0de7xigqDyv4PJlHvNN3iVo3yW_Dbkd8jzu-hrwydtzsNCZGNc5BOQkR1RMW6DE7HLMwHCAAt5vqf0Yjl8ZP2Zo4_a6IVskYaRh01wCXwK0WYE6Cg4x0vu7M-OQX5DtuEHutP382g-HrTjrjIMP1eUYIpnuftC04UnZhbaEd3xhCiDcGMfUS4Lwcb1a4F7ownodliw8W2pPCWelyrLN6gBMj669OxzDeZE0ZhffXzPc-S3D6lImOPdT990DCbW3S4ZBS2OG9hPENWgQjavRbLB0F98Uj4AMtp8xfquUK10u9TuZZqIGywcMcYjldSMm8yqlC47ttQZpamQl6eiV4s_b5Hi5QexJra8o6wtnRbKsL2_dJVfHUClJcGchagfy5nWjHzlFrZs_1HggnMSIek4tjBd9Mo'),
          Tools(
              name: 'Nutrisi AB Mix',
              imageUrl:
                  'https://lh3.googleusercontent.com/v6Dcp3Ag75iQ6I1EKEWZsmGU8sKlv2CtEZ4Wor5GBLb8Qa_FLGk6KrI9S2W5TfV4xEu6O_xL0LB-VmtgSs2IYeYZniOfL-JsKKe3PTLcN7CtGqD5yz7eu9iDEeWO2fZgqu-BumxYg_x65sZEHv5x6p9z4NvzeDW9RrXl1dSj9dEGvFxwsu-7TQOvnEsbVRvGO9IETilG4Fz2nhmuu2VoZGSrKK0-BTH_wav5u0Pdomkzuoncs1LjCvN9ggTQSN5TnTBmI-Ck7jAPV97Lsf5j5SVGncl14cdjaC4bdvR91oJQ8lXwj36vGnw9789CJcFRijUuomG91Jj8zMboSzYH3YHW4MaBGpwjKyQdWni1gZTdymhs9pnRxVjJN4hj4j4D4XzyIcNjCCyuQcFpWN1ykfQnet45ei85slheA3fTuIMVtrSB3Hhti2IvpqsAr0j71anqN_uibK7I5t2osdlNY3lDiAXHSOkKv1sT4yACtXOpIm1Bqyf4pBmOD5I02LQv4yYqgGY09S7xWzhcTmRBNJ8xoCs3vtJYaN0a6wznfuoU1qChChSSduQfriHAzWqvhmpeHVynY6bp3tsUt9FAlFVYtYFGKydx8UxPXmwwPzgXIlA_MQCbgbkjzEEKHpaJ-gGJlW21emNxN2h4k8dz-8mzgIvkwWj9JbKL5v5IhxKLNiCErCHwgYjicFkNMJ56Ae5bb4XMc6j6ra6AR2Z29uoE'),
          Tools(
              name: 'Tandon Air Nutrisi',
              imageUrl:
                  'https://lh3.googleusercontent.com/WIVlAhkqM2-BLmWuwH--D3C1mUm09Qr14EYKfHNLvDqcji0-yTBKffIaWCKWvDDcspm23EBikRP5Wpnx_RkBoaGmtSGBS4_mlTjWddE93nweW2_xAxJ2jwtCnjFlJwfNvMRFTD0bB6y3Yn_-pJFt8ejeaw8QEIRq3GQr-8A3ngcYFB-SLu4nDX2DS3WlO1pvkRhurPuEfN2GnGyktsXyawSSBMrKtQPUxuNL9XN3fwGOYXfjH_AVUYWxwQdcLsqdJGOU_LhDt8n_1KE46fUC2qGjIDuxkbcoC2Z40SBddYcNBdKpFfZZL4YfSiyULrigRxMUEqZzE5aIdmuXbkJm6FIgpblzOCQwq8c5XW66RDN0_drwGm1hVbCp8RQch2HlLbyby23KubGC0tDP1miLRj0bR6BStR9Dwh9l2zG6DwmEkaPFurmcsxNFaEZrK75g9QzWcYH-k3xk80Pia3_2lRMlCTvaR7z8bEv9jxakRJso1HMkv3ndcs1iH9zuVRdJqqAJL5csHgwLvjkPD23fI7PJFNqKg7WT9C3VlMmuIvY4zRAY9QqWQePYuBOCgt0FeiYwnGtEXK2D0fZ3myUhuVztGwra6_Q7ncpqXHPpQOKgzwlvzsi2k2MNRAb4ZJ1oZIRhHj2OLQ1aYck0NdGrQHTcYdG-jaCtULDG2249YMHHHz8ci-eBzEihIb_14EnU_iEuvPywG9kCtMd6Mpz33lxT=w699-h344-no?authuser=2')
        ],
        color: 0xFFFFD1A6,
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
        ]
        ),
        
    Tanaman(
        id: '3',
        title: 'Tomat',
        image: "assets/images/tomato.jpg",
        icon: "assets/images/icontomat.png",
        steps: [
           Steps(
            no: 1,
            step: 'Siapkan alat dan Bahan : 1.Rockwoll, 2.Sprayer/Penyemprot Air, 3.Pinset, 4.Benih Sawi',
            imageSteps: ''
          ),
          Steps(
            no: 2,
            step: 'Siapkan media tanam, potong rockwool setebal 2,5 cm. Iris memanjang sedalam kurang lebih 1 cm menjadi 3 bagian dan iris melintang menjadi 6 bagian sedalam 1 cm. Lihat gambar di bawah ini untuk detailnya.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2'
          ),
          Steps(
            no: 3,
            step: 'Masukkan benih ke dalam lubang dengan posisi kecambah di bawah (1 lubang diisi 1 benih)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2'
          ),
          Steps(
            no: 4,
            step: 'Setelah semua lubang terisi, basahi rockwool menggunakan sprayer/semprotan dengan kekuatan air yang lembut. Taruh semaian di tempat terbuka yang cukup sinar matahari.',
            imageSteps: ''
          ),
          Steps(
            no: 5,
            step: 'Pada tahap ini adalah tahap perawatan semai, jaga rockwool agar tetap lembab (tidak terlalu basah dan tidak terlalu kering)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2'
          ),
          Steps(
            no: 6,
            step: 'Setelah sawi berdaun 3 atau lebih, sudah waktunya untuk dipindah ke sistem hidroponik dan diberi nutrisi hidroponik. Umur sawi sekitar 7-10 hari setelah semai.',
            imageSteps: ''
          ),
          Steps(
            no: 7,
            step: 'Step ini adalah tahap pindah tanam. Pisahkan/potong rockwool berdasarkan irisan yang dibuat pada step awal. Apabila susah untuk memisahkan rockwool, maka bisa menggunakan cutter untuk memotong rockwool sampe terpisah. Taruh potongan rockwool ke dalam netpot yang sudah dikasih flanel (sumbu)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2'
          ),
          Steps(
            no: 8,
            step: 'Letakkan netpot ke dalam sistem hidroponik, pada tahap ini nutrisi yang diberikan kepekatannya 600 ppm. Kepekatan nutrisi dinaikkan setelah masuk 5 hari setelah pindah tanam menjadi 800 ppm. Setelah memasuki 10 hari setelah tanam, naikkan kepekatan nutrisi menjadi 1200 ppm. Jaga ppm nutrisi selalu stabil di angka tersebut sampai panen.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'
          ),
              
          Steps(
            no: 9,
            step: 'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
            imageSteps: ''
          ),
        ],
        color: 0xFFFFC4C0),
    Tanaman(
        id: '4',
        title: 'Kangkung Hidroponik',
        image: "assets/images/kangkung-bg.jpg",
        icon: "assets/images/iconkangkung.png",
        steps: [
          Steps(
            no: 1,
            step: 'Siapkan alat dan Bahan : 1.Rockwoll, 2.Sprayer/Penyemprot Air, 3.Pinset, 4.Benih Sawi',
            imageSteps: ''
          ),
          Steps(
            no: 2,
            step: 'Siapkan media tanam, potong rockwool setebal 2,5 cm. Iris memanjang sedalam kurang lebih 1 cm menjadi 3 bagian dan iris melintang menjadi 6 bagian sedalam 1 cm. Lihat gambar di bawah ini untuk detailnya.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cbU7bmqXkMzi4XRjH3TQJziQyfVaDwp12xcpf5IM81wYiAW44vU8XSv32ryCXwdOpxQAnGHJk5u96PNqYu0J7fkWms12gAfCd95jIuYijNCN2n0cn_YCKf9RZ_SY_9MYGRJsQvQaLxJutY9TCLWj2z=w600-h450-no?authuser=2'
          ),
          Steps(
            no: 3,
            step: 'Masukkan benih ke dalam lubang dengan posisi kecambah di bawah (1 lubang diisi 1 benih)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3feCSQbrcNyv2iJglyIcecnZnBsqNcIjh4PcPSDK5_-9k0IW7zczk7uvb_k-2C9Tn-xdISh72hUtkYIBdddKH_0BeXeYjwTU6eh_qNDBFiOrAol0Gi4u1AfY6AOSnpiVBh3aE_ds3hgXFJJIa7g33LD=w487-h512-no?authuser=2'
          ),
          Steps(
            no: 4,
            step: 'Setelah semua lubang terisi, basahi rockwool menggunakan sprayer/semprotan dengan kekuatan air yang lembut. Taruh semaian di tempat terbuka yang cukup sinar matahari.',
            imageSteps: ''
          ),
          Steps(
            no: 5,
            step: 'Pada tahap ini adalah tahap perawatan semai, jaga rockwool agar tetap lembab (tidak terlalu basah dan tidak terlalu kering)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3egwOc-PY9oHLgy-A8eWqyYrE43TxyuHULc9b7alCzj57apXNwpmbqFq7YFVWVqmpLIONiaBeOQP_db8sdouJ3OkHs0YqVC85qJT0k8AxU73y6eKmnHuA5OimrK3iOtQP_GMciDw1NZ4erdQolQUpjg=w1200-h630-no?authuser=2'
          ),
          Steps(
            no: 6,
            step: 'Setelah sawi berdaun 3 atau lebih, sudah waktunya untuk dipindah ke sistem hidroponik dan diberi nutrisi hidroponik. Umur sawi sekitar 7-10 hari setelah semai.',
            imageSteps: ''
          ),
          Steps(
            no: 7,
            step: 'Step ini adalah tahap pindah tanam. Pisahkan/potong rockwool berdasarkan irisan yang dibuat pada step awal. Apabila susah untuk memisahkan rockwool, maka bisa menggunakan cutter untuk memotong rockwool sampe terpisah. Taruh potongan rockwool ke dalam netpot yang sudah dikasih flanel (sumbu)',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3fHm7lyucEkr83DfzTuq8t2LxEchaB7q4mlkGidWyI8UKk62Sag3gnlxeVxtI_PhHUuvVmESyHwl90AbcByHGBoHA62iP6lICu0obn4-hUZP1fq1d05COx9VvT2_HCjp3Jxuynv4xRP740Pzoy4IYuK=w640-h480-no?authuser=2'
          ),
          Steps(
            no: 8,
            step: 'Letakkan netpot ke dalam sistem hidroponik, pada tahap ini nutrisi yang diberikan kepekatannya 600 ppm. Kepekatan nutrisi dinaikkan setelah masuk 5 hari setelah pindah tanam menjadi 800 ppm. Setelah memasuki 10 hari setelah tanam, naikkan kepekatan nutrisi menjadi 1200 ppm. Jaga ppm nutrisi selalu stabil di angka tersebut sampai panen.',
            imageSteps: 'https://lh3.googleusercontent.com/pw/ACtC-3cqbcAHMIm_pOg9ZAurnbDjRtaKm30kOlG0_DWijULZL45yUMjKT-MFnwTu9gpy-TC3EbfqzysGFtFgIS0aubVtpXAq7fb3oOgGER6q9J9iP_T1otWq-kqibKMYETjonTyzbSx1rFqEqcx0fJIJgZ0M=w459-h343-no?authuser=2'
          ),
              
          Steps(
            no: 9,
            step: 'Masa Panen Sayur Sawi Hidroponik adalah sekitar 30-40 hari dengan cara dicabut beserta akarnya.',
            imageSteps: ''
          ),
        ],
        color: 0xFFB3D054,
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
        ]
        ),
  ];
}
