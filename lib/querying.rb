def select_books_titles_and_years_in_first_series_order_by_year
  <<-SQL
    SELECT title, year
    FROM books
    WHERE series_id=1
    ORDER BY year
  SQL
end

def select_name_and_motto_of_char_with_longest_motto
  <<-SQL
    SELECT name, motto
    FROM characters
    ORDER BY LENGTH(motto) DESC
    LIMIT 1
  SQL
end

def select_value_and_count_of_most_prolific_species
  <<-SQL
   SELECT species, COUNT(species) AS total
   FROM characters
   GROUP BY species
   ORDER BY species DESC
   LIMIT 1
   SQL
end

 def select_name_and_series_subgenres_of_authors
  <<-SQL
  SELECT authors.name, subgenres.name
  FROM authors
  JOIN series
  ON series.author_id = authors.id
  JOIN subgenres
  ON series.subgenre_id = subgenres.id
SQL
end


def select_series_title_with_most_human_characters
  <<-SQL
    SELECT series.title
    FROM characters
    INNER JOIN series
    On characters. author_id = series.author_id
    GROUP BY series.title, characters.species
    HAVING characters.species = 'human'
    ORDER BY characters.species
    LIMIT 1
    SQL
end

def select_character_names_and_number_of_books_they_are_in
  <<-SQL
    SELECT characters.name, COUNT(*) as book_count
    FROM character_books
    JOIN characters
    ON character_books.character_id = characters.id
    GROUP BY characters.name
    ORDER BY book_count DESC, characters.name ASC
    SQL
end