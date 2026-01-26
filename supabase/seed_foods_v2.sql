-- =========================================================================
-- SEED FOODS V2: Makanan Korea, Jepang & Bahan Makanan Tambahan
-- Data berdasarkan penelitian asam urat, diabetes, dan kolesterol
-- =========================================================================

INSERT INTO foods (name, gout_status, diabetes_status, cholesterol_status, notes, tags) VALUES

    -- =========================================================================
    -- 🌿 1. SUPERFOOD & BAHAN MAKANAN SEHAT
    -- =========================================================================
    ('Ginseng (Korea/Merah)', 'safe', 'safe', 'safe', 
     'Membantu menghambat enzim Xanthine Oxidase (penurun asam urat). Anti-radang alami. Meningkatkan sensitivitas insulin. PERINGATAN: Hindari jamu ginseng sachet murah, pilih ginseng murni.', 
     ARRAY['ginseng', 'herbal', 'korea', 'superfood', 'teh']),

    ('Seledri (Celery)', 'safe', 'safe', 'safe', 
     'Superfood untuk asam urat! Mengandung 3-n-butylphthalide & Apigenin yang efektif mengurangi peradangan sendi. Sangat dianjurkan sebagai jus atau camilan mentah.', 
     ARRAY['seledri', 'celery', 'sayur', 'superfood', 'jus']),

    ('Paprika', 'safe', 'safe', 'safe', 
     'Raja Vitamin C! Kandungan Vit C lebih tinggi dari jeruk. Membantu ginjal mengeluarkan asam urat melalui urin. Aman untuk diabetes.', 
     ARRAY['paprika', 'sayur', 'vitamin c', 'superfood']),

    ('Goji Berry', 'safe', 'safe', 'safe', 
     'Sumber Vitamin C terbaik. Antioksidan kuat anti-inflamasi. Indeks glikemik rendah. Membantu profil lemak darah. Sangat direkomendasikan.', 
     ARRAY['goji', 'berry', 'buah', 'superfood', 'teh']),

    ('Bawang Putih (Garlic)', 'safe', 'safe', 'safe', 
     'Anti-radang alami yang membantu meredakan bengkak sendi. Sangat bagus untuk kesehatan jantung dan kolesterol.', 
     ARRAY['bawang', 'garlic', 'bumbu', 'sehat']),

    ('Lada/Cabai (Pepper)', 'safe', 'safe', 'safe', 
     'Kandungan Capsaicin adalah pereda nyeri alami. Aman dikonsumsi. Yang bahaya bukan cabainya, tapi jika diolah dengan minyak jelantah.', 
     ARRAY['lada', 'cabai', 'pepper', 'bumbu', 'pedas']),

    ('Apel (Apple)', 'safe', 'safe', 'safe', 
     'Mengandung Asam Malat yang menetralkan asam urat. WAJIB dimakan UTUH dengan kulit. JANGAN dijus saring (fruktosa pekat tanpa serat).', 
     ARRAY['apel', 'apple', 'buah', 'sehat']),

    ('Plum (Buah Segar)', 'safe', 'safe', 'safe', 
     'Kaya antioksidan polifenol anti-peradangan. Pilih buah plum segar, hindari manisan plum kering yang penuh gula.', 
     ARRAY['plum', 'buah', 'sehat']),

    ('Tahu (Tofu)', 'safe', 'safe', 'safe', 
     'Studi terbaru: Purin nabati (kedelai) jauh lebih aman dari purin hewani. Sumber protein terbaik pengganti daging merah. Pilih tahu rebus/kukus, hindari tahu goreng deep-fry.', 
     ARRAY['tahu', 'tofu', 'kedelai', 'protein', 'vegetarian']),

    ('Edamame', 'safe', 'safe', 'safe', 
     'Kacang kedelai muda, aman untuk asam urat. Sumber protein nabati yang baik. Rendah lemak, tinggi serat.', 
     ARRAY['edamame', 'kedelai', 'kacang', 'jepang', 'sehat']),

    -- =========================================================================
    -- 🟡 2. BAHAN MAKANAN - HATI-HATI / BATASI
    -- =========================================================================
    ('Toge (Bean Sprouts)', 'caution', 'safe', 'safe', 
     'Mengandung purin tingkat sedang. Jika tidak kumat, boleh dalam porsi wajar. Jika sendi nyeri, hindari dulu.', 
     ARRAY['toge', 'tauge', 'kecambah', 'sayur']),

    ('Kembang Kol (Cauliflower)', 'caution', 'safe', 'safe', 
     'Sayuran Cruciferous dengan purin lebih tinggi dari sayur hijau biasa. Jangan makan berlebihan, irisan di capcay masih aman.', 
     ARRAY['kembang kol', 'cauliflower', 'sayur']),

    ('Kurma (Dates)', 'safe', 'danger', 'safe', 
     'Purin rendah TAPI sangat tinggi Fruktosa. Pemecahan fruktosa berlebih = produksi asam urat naik. AMAN: 1-3 butir/hari. BAHAYA: berlebihan.', 
     ARRAY['kurma', 'dates', 'buah', 'manis']),

    ('Kismis (Raisins)', 'caution', 'danger', 'safe', 
     'Anggur kering dengan gula buah (Fruktosa) sangat pekat. Pemicu asam urat dari gula. Hanya boleh sebagai topping sedikit, jangan dijadikan camilan.', 
     ARRAY['kismis', 'raisins', 'buah kering', 'manis']),

    -- =========================================================================
    -- 🇰🇷 3. MAKANAN KOREA - AMAN
    -- =========================================================================
    ('Bibimbap (Vegetarian)', 'safe', 'safe', 'safe', 
     'Versi vegetarian/tahu sangat aman. Nasi campur sayuran dengan gochujang. Hindari versi daging merah.', 
     ARRAY['bibimbap', 'korea', 'nasi', 'sayur', 'vegetarian']),

    ('Dakgalbi (Ayam Korea)', 'safe', 'caution', 'safe', 
     'Ayam panggang pedas Korea. Lebih aman dari daging merah. WAJIB buang kulitnya. Sausnya manis, perhatikan gula.', 
     ARRAY['dakgalbi', 'ayam', 'korea', 'panggang']),

    ('Kimbap (Isian Sayur/Keju)', 'safe', 'safe', 'safe', 
     'Nasi gulung Korea. Pilih isian tuna/keju/sayuran. Hindari isian daging merah.', 
     ARRAY['kimbap', 'korea', 'nasi', 'sehat']),

    -- =========================================================================
    -- 🇰🇷 4. MAKANAN KOREA - HATI-HATI
    -- =========================================================================
    ('Topoki (Tteokbokki)', 'caution', 'danger', 'safe', 
     'Kue beras (aman, karbohidrat) + Saus Gochujang (gula tinggi). BAHAYA: sering dicampur Odeng/sosis (purin tinggi). Tips: makan kue berasnya saja.', 
     ARRAY['topoki', 'tteokbokki', 'korea', 'pedas', 'kue beras']),

    ('Kimchi', 'caution', 'safe', 'safe', 
     'Sawi/lobak fermentasi (probiotik bagus). MASALAH: Bumbu pakai kecap ikan/pasta udang (purin). Sangat tinggi Natrium (berat kerja ginjal). Makan sedikit sebagai penyegar.', 
     ARRAY['kimchi', 'korea', 'fermentasi', 'sayur']),

    ('Japchae', 'caution', 'safe', 'safe', 
     'Mie Dangmyeon (pati ubi jalar, aman). BATASI: Bayam & jamur (purin sedang). WASPADA: Irisan daging sapi. Tips: ambil mie lebih banyak, sisihkan daging.', 
     ARRAY['japchae', 'korea', 'mie', 'sayur']),

    -- =========================================================================
    -- 🇰🇷 5. MAKANAN KOREA - BAHAYA
    -- =========================================================================
    ('Oden (Eomuk / Fish Cake)', 'danger', 'safe', 'caution', 
     'Olahan daging ikan padat (seperti bakso ikan). Tinggi purin. BAHAYA EKSTRA: Kuah dari rebusan ikan teri (Raja Purin). Jangan menyeruput kuahnya!', 
     ARRAY['oden', 'eomuk', 'fish cake', 'korea', 'seafood']),

    ('Bulgogi (Daging Sapi Korea)', 'danger', 'caution', 'danger', 
     'Daging merah = pantangan utama asam urat. Saus juga manis (gula). Cicipi 1-2 lembar boleh, jangan satu porsi penuh.', 
     ARRAY['bulgogi', 'korea', 'daging', 'sapi', 'bbq']),

    ('Jajangmyeon (Mie Saus Hitam)', 'danger', 'danger', 'danger', 
     'Saus Chunjang (kedelai hitam, purin sedang). Isian hampir selalu daging babi atau seafood ditumis berminyak. Mie tepung olahan. Versi restoran berisiko tinggi.', 
     ARRAY['jajangmyeon', 'korea', 'mie', 'daging']),

    ('Galbi (Iga Sapi/Babi Korea)', 'danger', 'caution', 'danger', 
     'Iga panggang Korea. Daging merah berlemak tinggi. Sangat buruk untuk asam urat dan kolesterol.', 
     ARRAY['galbi', 'korea', 'iga', 'daging', 'bbq']),

    ('Gopchang / Daechang (Jeroan Korea)', 'danger', 'caution', 'danger', 
     'Usus sapi/babi panggang BBQ Korea. Level purin dan kolesterol "Dewa". Sekali makan bisa langsung nyut-nyutan. Hindari total!', 
     ARRAY['gopchang', 'daechang', 'korea', 'jeroan', 'bbq']),

    ('Jeotgal (Seafood Fermentasi)', 'danger', 'safe', 'caution', 
     'Udang/kerang/cumi mentah difermentasi garam. Sering jadi banchan atau bumbu inti kimchi. Purin tinggi + Sodium tinggi.', 
     ARRAY['jeotgal', 'korea', 'fermentasi', 'seafood']),

    ('Nakji-bokkeum / Ojingo (Gurita/Cumi)', 'danger', 'safe', 'danger', 
     'Tumis gurita/cumi pedas Korea. Seafood moluska (lunak) sangat cepat menaikkan asam urat.', 
     ARRAY['nakji', 'ojingo', 'gurita', 'cumi', 'korea', 'seafood']),

    ('Haemul Jjigae (Sup Seafood Korea)', 'danger', 'safe', 'danger', 
     'Sup seafood campuran (udang, kerang, cumi, dll). Kuah kaldu ikan. Kombinasi purin tinggi.', 
     ARRAY['haemul', 'jjigae', 'korea', 'sup', 'seafood']),

    ('Kaldu Ikan Teri Korea (Myeolchi Yuksu)', 'danger', 'safe', 'safe', 
     'Dasar hampir semua kuah sup Korea (Sundubu Jjigae, Doenjang Jjigae, Oden). Ikan teri = Raja Purin. SOLUSI: Tanya apakah pakai kaldu sapi/sayur.', 
     ARRAY['kaldu', 'teri', 'myeolchi', 'korea', 'kuah']),

    ('Somaek (Soju + Bir)', 'danger', 'danger', 'danger', 
     'Kombinasi maut! Bir mengandung ragi (purin tinggi). Alkohol menahan pembuangan asam urat. Double kill untuk ginjal.', 
     ARRAY['somaek', 'soju', 'bir', 'alkohol', 'korea']),

    -- =========================================================================
    -- 🇯🇵 6. MAKANAN JEPANG - AMAN
    -- =========================================================================
    ('Matcha (Teh Hijau Jepang)', 'safe', 'safe', 'safe', 
     'Antioksidan tinggi (EGCG). Membantu metabolisme dan anti-inflamasi. Aman tanpa gula. Hindari matcha latte manis.', 
     ARRAY['matcha', 'teh', 'jepang', 'sehat', 'minuman']),

    ('Miso Soup (Sup Miso)', 'safe', 'safe', 'safe', 
     'Fermentasi kedelai dalam bentuk pasta. Purin nabati aman. Probiotik bagus. Perhatikan sodium jika hipertensi.', 
     ARRAY['miso', 'sup', 'jepang', 'kedelai', 'fermentasi']),

    ('Onigiri (Isian Sayur/Umeboshi)', 'safe', 'safe', 'safe', 
     'Nasi kepal Jepang. Aman jika isian sayuran atau umeboshi (plum asin). Hindari isian salmon/tuna mentah berlebih.', 
     ARRAY['onigiri', 'nasi', 'jepang', 'snack']),

    ('Soba (Mie Buckwheat)', 'safe', 'safe', 'safe', 
     'Mie dari tepung buckwheat. Indeks glikemik lebih rendah dari mie biasa. Serat tinggi. Aman untuk asam urat.', 
     ARRAY['soba', 'mie', 'jepang', 'sehat']),

    ('Chawanmushi (Custard Telur Kukus)', 'safe', 'safe', 'caution', 
     'Telur dikukus lembut. Rendah lemak karena tidak digoreng. Kolesterol dari kuning telur perlu diperhatikan jika makan banyak.', 
     ARRAY['chawanmushi', 'telur', 'jepang', 'kukus']),

    ('Agedashi Tofu', 'safe', 'safe', 'caution', 
     'Tahu goreng dengan kuah dashi. Tahu aman, tapi digoreng menambah lemak. Kuah dashi perlu dicek (jika ikan = purin).', 
     ARRAY['agedashi', 'tofu', 'tahu', 'jepang']),

    ('Tamagoyaki (Telur Dadar Jepang)', 'safe', 'safe', 'caution', 
     'Telur dadar gulung manis. Aman untuk asam urat. Perhatikan kolesterol dari kuning telur dan kadar gula di resep.', 
     ARRAY['tamagoyaki', 'telur', 'jepang', 'sarapan']),

    ('Natto', 'caution', 'safe', 'safe', 
     'Kedelai fermentasi. Purin nabati aman tapi fermentasi bisa sedikit lebih tinggi. Kaya Vitamin K2 bagus untuk tulang. Makan dalam porsi wajar.', 
     ARRAY['natto', 'kedelai', 'jepang', 'fermentasi']),

    -- =========================================================================
    -- 🇯🇵 7. MAKANAN JEPANG - HATI-HATI
    -- =========================================================================
    ('Ramen', 'caution', 'danger', 'danger', 
     'Kaldu tulang/daging (purin). Mie tepung olahan (karbohidrat tinggi). Sering tinggi sodium. Topping chashu (daging babi) menambah risiko Jean kuah lebih aman.', 
     ARRAY['ramen', 'mie', 'jepang', 'kuah']),

    ('Udon', 'caution', 'danger', 'safe', 
     'Mie tepung terigu tebal. Karbohidrat tinggi (diabetes). Kuahnya perlu dicek: kaldu ikan = purin tinggi.', 
     ARRAY['udon', 'mie', 'jepang']),

    ('Tempura', 'caution', 'caution', 'danger', 
     'Sayur/udang digoreng tepung. Gorengan = lemak jenuh tinggi (kolesterol). Jika tempura udang = purin + lemak. Tempura sayur lebih aman.', 
     ARRAY['tempura', 'goreng', 'jepang']),

    ('Okonomiyaki', 'caution', 'caution', 'caution', 
     'Pancake Jepang dengan berbagai isian. Tepung olahan. Sering pakai seafood, daging, mayo. Pilih versi vegetarian lebih aman.', 
     ARRAY['okonomiyaki', 'jepang', 'pancake']),

    ('Yakitori (Sate Ayam)', 'safe', 'caution', 'safe', 
     'Sate ayam panggang. Ayam lebih aman dari daging merah. HINDARI: yakitori kulit (kolesterol) dan yakitori jeroan (purin tinggi). Pilih dada ayam.', 
     ARRAY['yakitori', 'ayam', 'jepang', 'panggang']),

    ('Gyoza (Pangsit Jepang)', 'caution', 'safe', 'caution', 
     'Pangsit isi daging/sayur. Isian daging babi = purin. Cara masak pan-fried = lemak. Pilih gyoza kukus isian sayur lebih aman.', 
     ARRAY['gyoza', 'pangsit', 'jepang']),

    ('Katsu Curry', 'caution', 'danger', 'danger', 
     'Nasi kari dengan daging goreng tepung (tonkatsu/chicken katsu). Gorengan + nasi putih banyak. Pilih kari sayuran tanpa katsu lebih aman.', 
     ARRAY['katsu', 'kari', 'jepang', 'goreng']),

    ('Sushi (Isian Sayur/Telur)', 'safe', 'caution', 'safe', 
     'Sushi vegetarian (kappa maki, tamago) aman. Nasi sushi mengandung gula (perhatikan diabetes). Hindari sushi seafood mentah berlebih.', 
     ARRAY['sushi', 'jepang', 'nasi', 'sayur']),

    -- =========================================================================
    -- 🇯🇵 8. MAKANAN JEPANG - BAHAYA
    -- =========================================================================
    ('Sashimi (Ikan Mentah)', 'danger', 'safe', 'caution', 
     'Ikan mentah iris tipis. Ikan laut tertentu tinggi purin (tuna, salmon, makarel). Makan berlebih memicu asam urat.', 
     ARRAY['sashimi', 'ikan', 'jepang', 'mentah']),

    ('Sushi (Isian Seafood)', 'danger', 'caution', 'caution', 
     'Sushi dengan isian ikan mentah, udang, atau seafood lain. Purin tinggi dari seafood. Batasi konsumsi.', 
     ARRAY['sushi', 'jepang', 'seafood', 'ikan']),

    ('Unagi / Anago (Belut Jepang)', 'danger', 'caution', 'danger', 
     'Belut panggang dengan saus manis. Belut sangat tinggi purin. Saus mengandung gula. Hindari untuk asam urat.', 
     ARRAY['unagi', 'anago', 'belut', 'jepang']),

    ('Takoyaki (Bola Gurita)', 'danger', 'caution', 'caution', 
     'Bola tepung berisi potongan gurita. Gurita = seafood moluska tinggi purin. Tepung goreng menambah karbohidrat.', 
     ARRAY['takoyaki', 'gurita', 'jepang', 'snack']),

    ('Gyudon (Rice Bowl Daging Sapi)', 'danger', 'danger', 'danger', 
     'Nasi dengan topping daging sapi manis. Daging merah (purin) + nasi putih banyak (gula darah) + saus manis. Kombinasi buruk.', 
     ARRAY['gyudon', 'daging', 'sapi', 'jepang', 'nasi']),

    ('Tonkatsu (Babi Goreng)', 'danger', 'danger', 'danger', 
     'Daging babi digoreng tepung tebal. Daging merah + gorengan = purin + lemak jenuh. Sangat buruk untuk asam urat dan kolesterol.', 
     ARRAY['tonkatsu', 'babi', 'goreng', 'jepang']),

    ('Chirashi Don (Sashimi Bowl)', 'danger', 'caution', 'caution', 
     'Nasi dengan berbagai macam ikan mentah di atas. Kombinasi banyak seafood = purin tinggi.', 
     ARRAY['chirashi', 'sashimi', 'jepang', 'nasi', 'seafood']),

    ('Ikura (Telur Ikan Salmon)', 'danger', 'safe', 'danger', 
     'Telur ikan salmon. Tinggi purin dan kolesterol. Sering dipakai topping sushi. Hindari atau sangat batasi.', 
     ARRAY['ikura', 'telur ikan', 'jepang', 'seafood']),

    ('Uni (Bulu Babi)', 'danger', 'safe', 'danger', 
     'Sea urchin / landak laut. Seafood mewah dengan purin dan kolesterol tinggi. Hindari untuk asam urat.', 
     ARRAY['uni', 'sea urchin', 'jepang', 'seafood']),

    ('Mentaiko (Telur Ikan Cod)', 'danger', 'safe', 'danger', 
     'Telur ikan cod pedas. Tinggi purin dan kolesterol seperti telur ikan lainnya. Sering jadi pasta atau topping.', 
     ARRAY['mentaiko', 'telur ikan', 'jepang', 'pedas']),

    ('Fugu (Ikan Buntal)', 'danger', 'safe', 'caution', 
     'Ikan laut yang juga tinggi purin. Selain risiko racun jika tidak diolah benar, juga tidak baik untuk asam urat.', 
     ARRAY['fugu', 'ikan', 'jepang']),

    ('Dashi Kaldu Ikan (Katsuobushi)', 'danger', 'safe', 'safe', 
     'Kaldu dari serutan ikan cakalang kering. Dasar banyak masakan Jepang. Tinggi purin karena ekstrak ikan pekat. Alternatif: kaldu kombu (rumput laut).', 
     ARRAY['dashi', 'kaldu', 'katsuobushi', 'jepang']),

    ('Sake (Alkohol Jepang)', 'danger', 'caution', 'caution', 
     'Alkohol beras Jepang. Seperti alkohol lain, menghambat pembuangan asam urat oleh ginjal. Batasi atau hindari.', 
     ARRAY['sake', 'alkohol', 'jepang', 'minuman']);

-- =========================================================================
-- 📝 CATATAN PENTING:
-- - safe = Aman dikonsumsi
-- - caution = Hati-hati, batasi porsi
-- - danger = Bahaya, hindari atau sangat batasi
-- =========================================================================
