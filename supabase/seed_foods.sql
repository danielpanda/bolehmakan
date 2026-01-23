-- Add New Foods Data (Including Previous & New Request)
INSERT INTO foods (name, gout_status, diabetes_status, cholesterol_status, notes, tags) VALUES
    -- =========================================================================
    -- ❌ 1. JEROAN (Level Bahaya Tertinggi ☠️)
    -- =========================================================================
    ('Hati / Jeroan', 'danger', 'caution', 'danger', 
     'Mengandung purin sangat tinggi. Pemicu serangan asam urat paling cepat & instan. Wajib hindari total.', 
     ARRAY['jeroan', 'hati', 'ampela', 'usus', 'babat', 'otak', 'ginjal', 'daging']),

    ('Soto Betawi / Jeroan', 'danger', 'caution', 'danger', 
     'Jeroan sapi dengan kuah santan. Kombinasi mematikan untuk asam urat dan kolesterol.', 
     ARRAY['soto', 'betawi', 'jeroan', 'santan', 'kuah']),

    -- =========================================================================
    -- ❌ 2. MAKANAN LAUT & IKAN (SEAFOOD) 🦐
    -- =========================================================================
    ('Seafood (Udang, Kepiting, Cumi)', 'danger', 'safe', 'danger', 
     'Kandungan purin tinggi. Meningkatkan kadar asam urat dalam darah dengan cepat. Juga tinggi kolesterol.', 
     ARRAY['seafood', 'udang', 'kepiting', 'cumi', 'lobster', 'kerang', 'tiram', 'laut']),
     
    ('Ikan Laut (Sarden, Makarel, Teri)', 'danger', 'safe', 'caution',
     'Ikan laut tertentu seperti sarden, makarel, dan teri mengandung purin tinggi.',
     ARRAY['ikan', 'laut', 'sarden', 'makarel', 'teri', 'asin']),
     
    ('Siomay Bandung (Ikan)', 'danger', 'caution', 'caution',
     'Terbuat dari ikan tenggiri (purin sedang-tinggi). Bumbu kacang manis (gula).',
     ARRAY['siomay', 'ikan', 'bandung', 'jajanan']),

    ('Batagor', 'danger', 'caution', 'danger',
     'Adonan ikan digoreng. Purin dari ikan, kolesterol dari minyak goreng. Bumbu kacang manis.',
     ARRAY['batagor', 'goreng', 'ikan', 'jajanan']),
     
    ('Pempek Palembang', 'caution', 'caution', 'caution',
     'Adonan ikan tenggiri. Cuko mengandung banyak gula. Gorengan menambah lemak.',
     ARRAY['pempek', 'ikan', 'goreng', 'palembang']),

    -- =========================================================================
    -- ⚠️ 3. DAGING MERAH, OLAHAN & GORENGAN 🥩
    -- =========================================================================
    ('Daging Merah (Sapi/Kambing)', 'danger', 'caution', 'danger', 
     'Tinggi purin & lemak jenuh. Boleh makan sedikit sekali, jika berlebih memicu nyeri sendi.', 
     ARRAY['daging', 'merah', 'sapi', 'kambing', 'domba', 'bebek', 'babi']),
     
    ('Daging Olahan (Sosis/Nugget)', 'danger', 'danger', 'danger', 
     'Tinggi purin, garam, dan pengawet. Buruk untuk asam urat, diabetes, dan kolesterol.', 
     ARRAY['olahan', 'sosis', 'kornet', 'nugget', 'daging', 'asap']),

    ('Bakso Sapi', 'caution', 'caution', 'danger',
     'Daging sapi olahan, sering mengandung lemak jenuh tinggi. Kuah kaldu juga mengandung purin.',
     ARRAY['bakso', 'sapi', 'daging', 'kuah']),

    ('Gorengan (Umum)', 'caution', 'caution', 'danger', 
     'Lemak jenuh menghambat ginjal membuang asam urat. Memicu penumpukan kolesterol.', 
     ARRAY['gorengan', 'timus', 'bakwan', 'kerupuk', 'minyak', 'singkong']),

    ('Kerupuk', 'safe', 'caution', 'danger',
     'Terutama kerupuk putih/udang. Digoreng dalam minyak banyak (Cholesterol). Tinggi karbohidrat.',
     ARRAY['kerupuk', 'snack', 'goreng']),

    -- =========================================================================
    -- ⚠️ 4. SAYURAN & KACANG TERTENTU 🥬
    -- =========================================================================
    ('Emping / Melinjo', 'danger', 'safe', 'caution', 
     'Sangat tinggi purin. Pemicu utama nyeri asam urat bagi banyak orang. Hindari.', 
     ARRAY['emping', 'melinjo', 'kacang', 'snack']),
     
    ('Sayuran Hijau Tertentu (Bayam/Kangkung)', 'caution', 'safe', 'safe', 
     'Mengandung purin sedang. Bisa memicu nyeri bagi sebagian orang sensitif, terutama saat kambuh.', 
     ARRAY['sayur', 'bayam', 'kangkung', 'daun singkong', 'kembang kol', 'jamur']),
     
    ('Orak Arik Telur', 'safe', 'safe', 'caution',
     'Kuning telur mengandung kolesterol tinggi. Putih telur aman.',
     ARRAY['telur', 'orak arik', 'sarapan']),

    -- =========================================================================
    -- ❌ 5. MAKANAN MANIS, COKELAT & SUSU 🍫
    -- =========================================================================
    ('Cokelat (Manis/Susu)', 'safe', 'danger', 'caution',
     'Tinggi gula (Diabetes) dan lemak. Dark chocolate (murni) lebih aman.',
     ARRAY['cokelat', 'manis', 'camilan', 'dessert']),
     
    ('Dark Chocolate (>70%)', 'safe', 'safe', 'safe',
     'Kaya antioksidan, rendah gula. Aman dikonsumsi dalam jumlah wajar.',
     ARRAY['cokelat', 'pahit', 'sehat']),
     
    ('Susu Full Cream / Kental Manis', 'safe', 'danger', 'danger',
     'Tinggi lemak jenuh dan gula. Susu rendah lemak (Low Fat) justru baik untuk membuang asam urat.',
     ARRAY['susu', 'manis', 'kental manis', 'minuman']),
     
    ('Susu Low Fat / Skim', 'safe', 'safe', 'safe',
     'Protein susu membantu ekskresi asam urat. Pilihan terbaik untuk penderita asam urat.',
     ARRAY['susu', 'sehat', 'diet', 'minuman']),
     
    ('Es Krim', 'safe', 'danger', 'danger',
     'Tinggi gula dan lemak jenuh. Buruk untuk diabetes dan kolesterol.',
     ARRAY['es krim', 'dessert', 'manis', 'susu']),

    -- =========================================================================
    -- ☕ 6. MINUMAN (KOPI, TEH, ALKOHOL) 🍺
    -- =========================================================================
    ('Kopi Hitam (Tanpa Gula)', 'safe', 'safe', 'safe',
     'Beberapa studi menunjukkan kopi dapat menurunkan risiko asam urat. Aman jika tanpa gula.',
     ARRAY['kopi', 'hitam', 'minuman', 'kafein']),
     
    ('Kopi Susu Gula Aren', 'safe', 'danger', 'caution',
     'Kandungan gula aren dan susu full cream berbahaya untuk Diabetes dan Kolesterol.',
     ARRAY['kopi', 'susu', 'manis', 'gula aren']),
     
    ('Minuman Bersoda', 'caution', 'danger', 'caution', 
     'Fruktosa tinggi memicu produksi asam urat berlebih. Sangat buruk untuk gula darah.', 
     ARRAY['minuman', 'soda', 'karbonasi', 'manis']),
     
    ('Alkohol (Bir/Wine)', 'danger', 'caution', 'danger', 
     'Menghambat ginjal membuang asam urat. Pemicu serangan yang kuat.', 
     ARRAY['alkohol', 'bir', 'wine', 'minuman']),
     
    ('Jus Buah Kemasan', 'caution', 'danger', 'safe',
     'Tinggi fruktosa (gula buah) terkonsentrasi. Memicu asam urat dan gula darah.',
     ARRAY['jus', 'minuman', 'buah', 'manis']),

    -- =========================================================================
    -- 🍜 7. MIE & TEPUNG OLAHAN 🍜
    -- =========================================================================
    ('Mie Instan', 'caution', 'danger', 'danger',
     'Tinggi sodium, pengawet, dan karbohidrat olahan. Bumbu bisa mengandung ekstrak ragi (purin).',
     ARRAY['mie', 'instan', 'cepat saji', 'jajanan']),

    ('Roti Putih', 'safe', 'danger', 'safe',
     'Indeks glikemik tinggi, cepat menaikkan gula darah. Pilih roti gandum.',
     ARRAY['roti', 'tepung', 'sarapan']),

    ('Produk Tepung Olahan', 'caution', 'danger', 'caution', 
     'Karbohidrat olahan tinggi. Kurang baik untuk metabolisme gula dan asam urat.', 
     ARRAY['tepung', 'macaroni', 'kue', 'biskuit']),

    -- =========================================================================
    -- 🍠 8. LAIN-LAIN (DURIAN, TAPE, SANTAN)
    -- =========================================================================
    ('Durian', 'danger', 'danger', 'caution', 
     'Mengandung alkohol/gas yang memicu asam urat. Tinggi gula, bahaya untuk diabetes.', 
     ARRAY['buah', 'durian', 'manis', 'alkohol']),
     
    ('Tape Singkong', 'danger', 'caution', 'safe', 
     'Mengandung ragi/alkohol yang menjadi pemicu kuat serangan asam urat.', 
     ARRAY['tape', 'singkong', 'fermentasi', 'ragi']),
     
    ('Gulai / Masakan Bersantan', 'caution', 'caution', 'danger',
     'Santan mengandung lemak jenuh tinggi. Buruk untuk kolesterol. Sering dimasak dengan daging/jeroan.',
     ARRAY['gulai', 'santan', 'kuah', 'padang']),
     
    ('Kaldu Daging Kental', 'danger', 'caution', 'danger', 
     'Sari purin dari daging terkumpul di kuah kental. Sangat pekat purin.', 
     ARRAY['kaldu', 'kuah', 'sup', 'daging']);
