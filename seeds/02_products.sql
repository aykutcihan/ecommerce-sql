-- ============================================================
-- Seed: Products (20 rows)
-- ============================================================

INSERT INTO products (name, description, price, stock, category_id) VALUES
    ('iPhone 15',                'Apple smartphone 128GB',              999.99,  50, 1),
    ('Samsung Galaxy S24',       'Android smartphone 256GB',            849.99,  40, 1),
    ('MacBook Pro 14"',          'Apple laptop M3 chip',               1999.99,  20, 1),
    ('Sony WH-1000XM5',          'Wireless noise-cancelling headphones',349.99,  75, 1),
    ('Dell Monitor 27"',         '4K UHD display',                      499.99,  30, 1),
    ('Levi''s 501 Jeans',        'Classic straight fit denim',           59.99, 200, 2),
    ('Nike Air Max 90',          'Iconic running shoes',                109.99, 150, 2),
    ('Wool Sweater',             'Merino wool crewneck',                 79.99, 120, 2),
    ('Leather Jacket',           'Genuine leather biker jacket',        199.99,  60, 2),
    ('Cotton T-Shirt',           'Basic everyday tee',                   19.99, 500, 2),
    ('The Pragmatic Programmer', 'Classic software development book',    45.99, 100, 3),
    ('Clean Code',               'Writing maintainable code',            39.99,  80, 3),
    ('Dune',                     'Sci-fi epic novel',                    16.99, 200, 3),
    ('Atomic Habits',            'Build good habits break bad ones',     17.99, 300, 3),
    ('Coffee Maker',             '12-cup programmable brewer',           79.99,  90, 4),
    ('Cast Iron Skillet',        '12-inch pre-seasoned pan',             44.99, 110, 4),
    ('Knife Set',                '15-piece stainless steel',             89.99,  70, 4),
    ('Yoga Mat',                 'Non-slip 6mm thickness',               29.99, 180, 5),
    ('Dumbbells 20kg',           'Adjustable weight set',                89.99,  55, 5),
    ('Hiking Backpack',          '45L waterproof trail pack',            99.99,  45, 5);
