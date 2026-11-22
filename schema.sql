-- schema.sql 
-- Bulls Baycare: diagnostic tests, test costs, and changes waiting for staff.

CREATE TABLE IF NOT EXISTS diagnostic_tests (
    test_id INTEGER PRIMARY KEY, 
    test_name TEXT NOT NULL, 
    category TEXT NOT NULL, 
    description TEXT NOT NULL, 
    preparation TEXT NOT NULL, 
    test_turnaround_time TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS test_costs (
    test_id INTEGER PRIMARY KEY, 
    cash_price REAL NOT NULL, 
    insured_estimate REAL NOT NULL, 
    cost_note TEXT NOT NULL);

CREATE TABLE IF NOT EXISTS change_requests (
    number INTEGER PRIMARY KEY AUTOINCREMENT, 
    test_id INTEGER NOT NULL, 
    field_name TEXT NOT NULL, 
    proposed_value TEXT NOT NULL, 
    reason TEXT NOT NULL, 
    status TEXT NOT NULL DEFAULT 'waiting', 
    reviewed_by TEXT);

INSERT OR IGNORE INTO diagnostic_tests (test_id, test_name, category, description, preparation, test_turnaround_time) VALUES 
(1, 'Complete Blood Count (CBC)', 'Blood Test', 'Measures red blood cells, white blood cells, and platelets.', 'No fasting typically required.', '1-2 business days'),
(2, 'Lipid Panel', 'Blood Test',
 'Measures cholesterol and triglyceride levels.',
 'Fasting may be required depending on provider instructions.',
 '1-2 business days'),
(3, 'Comprehensive Metabolic Panel (CMP)', 'Blood Test',
 'Measures several substances in the blood to assess metabolic health.',
 'Follow the preparation instructions provided by your healthcare provider.',
 '1-2 business days'),
(4, 'Basic Metabolic Panel (BMP)', 'Blood Test',
 'Measures glucose, electrolytes, and kidney-related markers.',
 'Follow the preparation instructions provided by your healthcare provider.',
 '1-2 business days'),
(5, 'Thyroid Stimulating Hormone (TSH)', 'Blood Test',
 'Measures thyroid-stimulating hormone levels.',
 'No special preparation typically required.',
 '2-3 business days');


INSERT OR IGNORE INTO test_costs (test_id, cash_price, insured_estimate, cost_note) VALUES 
(1, 45.00, 15.00, 'Illustrative estimates only; actual patient responsibility varies by insurance plan.'),
(2, 65.00, 20.00, 'Illustrative estimates only; actual patient responsibility varies by insurance plan.'),
(3, 75.00, 25.00, 'Illustrative estimates only; actual patient responsibility varies by insurance plan.'),
(4, 55.00, 18.00, 'Illustrative estimates only; actual patient responsibility varies by insurance plan.'),
(5, 50.00, 17.00, 'Illustrative estimates only; actual patient responsibility varies by insurance plan.');