-- 🍽️ Health Food Checker Database Schema
-- Jalankan script ini di Supabase SQL Editor

-- 🗄️ Create foods table
CREATE TABLE IF NOT EXISTS foods (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    image_url TEXT,
    gout_status TEXT NOT NULL DEFAULT 'caution' CHECK (gout_status IN ('safe', 'caution', 'danger')),
    diabetes_status TEXT NOT NULL DEFAULT 'caution' CHECK (diabetes_status IN ('safe', 'caution', 'danger')),
    cholesterol_status TEXT NOT NULL DEFAULT 'caution' CHECK (cholesterol_status IN ('safe', 'caution', 'danger')),
    notes TEXT,
    tags TEXT[] DEFAULT '{}',
    created_at TIMESTAMPTZ DEFAULT NOW(),
    updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 🔍 Create index for better search performance
CREATE INDEX IF NOT EXISTS idx_foods_name ON foods USING gin(to_tsvector('indonesian', name));
CREATE INDEX IF NOT EXISTS idx_foods_tags ON foods USING gin(tags);

-- 🔐 Enable Row Level Security (RLS)
ALTER TABLE foods ENABLE ROW LEVEL SECURITY;

-- 📖 Create policy for public read access
CREATE POLICY "Allow public read access" ON foods
    FOR SELECT
    USING (true);

-- 🌱 Sample Data - Makanan Indonesia
INSERT INTO foods (name, gout_status, diabetes_status, cholesterol_status, notes, tags) VALUES
    -- 🔴 Danger Foods
    ('Bebek Goreng', 'danger', 'caution', 'danger', 
     'Tinggi purin dan lemak jenuh. Hindari jika memiliki masalah asam urat atau kolesterol.', 
     ARRAY['bebek', 'goreng', 'daging', 'unggas']),
    
    ('Jeroan Sapi', 'danger', 'caution', 'danger', 
     'Sangat tinggi purin dan kolesterol. Paling berbahaya untuk penderita asam urat.', 
     ARRAY['jeroan', 'sapi', 'organ', 'hati']),
    
    ('Sate Kambing', 'danger', 'caution', 'danger', 
     'Daging merah tinggi purin dan lemak. Batasi atau hindari.', 
     ARRAY['sate', 'kambing', 'daging', 'merah']),
    
    ('Udang Goreng', 'danger', 'safe', 'caution', 
     'Seafood tinggi purin. Berbahaya untuk asam urat.', 
     ARRAY['udang', 'goreng', 'seafood', 'laut']),
    
    ('Cumi Goreng', 'danger', 'safe', 'danger', 
     'Tinggi purin dan kolesterol. Hindari jika ada masalah asam urat.', 
     ARRAY['cumi', 'goreng', 'seafood', 'laut']),
    
    ('Es Teh Manis', 'safe', 'danger', 'safe', 
     'Gula tinggi dapat meningkatkan kadar gula darah dengan cepat.', 
     ARRAY['teh', 'manis', 'minuman', 'gula']),
    
    ('Martabak Manis', 'safe', 'danger', 'danger', 
     'Tinggi gula dan lemak. Tidak dianjurkan untuk diabetes dan kolesterol.', 
     ARRAY['martabak', 'manis', 'kue', 'gula']),
    
    -- 🟡 Caution Foods
    ('Nasi Goreng', 'safe', 'caution', 'caution', 
     'Karbohidrat tinggi dan bisa mengandung lemak tergantung cara masak.', 
     ARRAY['nasi', 'goreng', 'karbohidrat', 'mie']),
    
    ('Ayam Goreng', 'caution', 'safe', 'caution', 
     'Purin sedang. Lebih baik dikonsumsi tanpa kulit.', 
     ARRAY['ayam', 'goreng', 'unggas', 'daging']),
    
    ('Rendang', 'caution', 'safe', 'danger', 
     'Daging sapi dengan santan. Tinggi lemak jenuh.', 
     ARRAY['rendang', 'sapi', 'padang', 'santan']),
    
    ('Gado-gado', 'safe', 'caution', 'caution', 
     'Sayuran sehat tapi saus kacang mengandung lemak dan gula.', 
     ARRAY['gado', 'sayur', 'kacang', 'salad']),
    
    ('Mie Goreng', 'safe', 'caution', 'caution', 
     'Karbohidrat tinggi dan bisa tinggi sodium.', 
     ARRAY['mie', 'goreng', 'karbohidrat', 'pasta']),
    
    ('Soto Ayam', 'caution', 'safe', 'caution', 
     'Protein baik tapi perhatikan minyak dan kulit ayam.', 
     ARRAY['soto', 'ayam', 'kuah', 'unggas']),
    
    -- 🟢 Safe Foods
    ('Sayur Bayam', 'safe', 'safe', 'safe', 
     'Sayuran hijau kaya nutrisi. Aman untuk semua kondisi.', 
     ARRAY['sayur', 'bayam', 'hijau', 'vegetable']),
    
    ('Tempe Goreng', 'safe', 'safe', 'safe', 
     'Protein nabati yang sehat. Baik untuk semua kondisi.', 
     ARRAY['tempe', 'goreng', 'nabati', 'kedelai']),
    
    ('Tahu Kukus', 'safe', 'safe', 'safe', 
     'Protein nabati rendah lemak. Sangat dianjurkan.', 
     ARRAY['tahu', 'kukus', 'nabati', 'kedelai']),
    
    ('Ikan Bakar', 'safe', 'safe', 'safe', 
     'Ikan air tawar rendah purin dan kaya omega-3.', 
     ARRAY['ikan', 'bakar', 'seafood', 'protein']),
    
    ('Sayur Asem', 'safe', 'safe', 'safe', 
     'Sayuran segar dengan kuah bening. Sangat aman.', 
     ARRAY['sayur', 'asem', 'kuah', 'vegetable']),
    
    ('Pecel', 'safe', 'safe', 'caution', 
     'Sayuran sehat. Perhatikan porsi bumbu kacang.', 
     ARRAY['pecel', 'sayur', 'kacang', 'salad']),
    
    ('Capcay', 'safe', 'safe', 'safe', 
     'Tumis sayuran beragam. Kaya serat dan vitamin.', 
     ARRAY['capcay', 'sayur', 'tumis', 'vegetable']),
    
    ('Bubur Ayam', 'caution', 'caution', 'safe', 
     'Karbohidrat halus dan ayam. Perhatikan porsi.', 
     ARRAY['bubur', 'ayam', 'sarapan', 'karbohidrat']);

-- ✅ Done! Tabel foods sudah siap digunakan 🎉
