-- Comments in SQL Start with dash-dash --

-- Find the app with an ID of 1880.
SELECT app_name
FROM analytics
WHERE id = 1880

-- Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT app_name, id
FROM analytics
WHERE last_updated = '2018-08-01'

-- Count the number of apps in each category, e.g. “Family | 1972”.
SELECT category, count(*)
from analytics
group by category

-- Find the top 5 most-reviewed apps and the number of reviews for each.
SELECT app_name, reviews
from analytics
order by reviews desc
limit 5

-- Find the app that has the most reviews with a rating greater than equal to 4.8.
SELECT app_name
from analytics
where rating >=4.8
order by reviews desc
limit 1

-- Find the average rating for each category ordered by the highest rated to lowest rated.
SELECT category, AVG(rating)
from analytics
group by category
order by AVG(rating) desc

-- Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
SELECT app_name, price, rating
FROM analytics
WHERE rating < 3
order by price desc

-- Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
SELECT app_name,rating 
from analytics
where min_installs < 50
AND rating >0
ORDER BY rating desc

-- Find the names of all apps that are rated less than 3 with at least 10000 reviews.
SELECT app_name
FROM analytics
where rating<3 
and reviews >=10000

-- Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
SELECT app_name 
from analytics 
where price between .1 and 1
order by reviews desc
limit 10

-- Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT app_name
from analytics
order by last_updated

-- Find the most expensive app (the query is very similar to #11).
SELECT app_name, price
from analytics
order by price desc

-- Count all the reviews in the Google Play Store.
SELECT sum(reviews)
from analytics

-- Find all the categories that have more than 300 apps in them.
SELECT category
from analytics
group by category
having count(category)> 300

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.

SELECT app_name, reviews, min_installs, (reviews/min_installs) as proportion
from analytics
where min_installs >= 100000
order by (reviews/min_installs)





