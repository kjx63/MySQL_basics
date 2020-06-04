# Run source query.sql
CREATE TABLE comments (
	content VARCHAR(100), 
	created_at TIMESTAMP DEFAULT NOW()
);