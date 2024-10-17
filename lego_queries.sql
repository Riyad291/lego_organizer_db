-- 1. Find sets that have a word or phrase in their description
-- This query searches for a specific word or phrase in the set descriptions.
-- Replace 'word_or_phrase' with the actual search term.
SELECT * 
FROM sets 
WHERE description LIKE '%word_or_phrase%';

-- 2. Sort sets by the highest piece count
-- This query sorts the LEGO sets by the piece count in descending order.
-- Ensure that your 'sets' table includes a 'piece_count' column.
SELECT * 
FROM sets 
ORDER BY piece_count DESC;

-- 3. Show only sets that belong to a specific theme
-- This query filters LEGO sets by a specific theme.
-- Replace 'theme_name' with the desired theme, such as 'Star Wars' or 'Harry Potter'.
SELECT * 
FROM sets 
WHERE theme = 'theme_name';

-- 4. Paginate the list of sets, showing 4 sets at a time
-- This query paginates the result set, showing 4 sets at a time.
-- Replace 'page_number' with the page you want to view (starting from 1).
SET @limit = 4; -- Show 4 sets per page
SET @offset = (@limit * (page_number - 1)); -- Calculate the starting point for each page

SELECT * 
FROM sets 
LIMIT @limit OFFSET @offset;
