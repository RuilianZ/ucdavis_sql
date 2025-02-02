Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



Part 1: Yelp Dataset Profiling and Understanding

1. Profile the data by finding the total number of records for each of the tables below:

i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000



2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

i. Business = 10000
ii. Hours = 1562
iii. Category = 2643
iv. Attribute = 1115
v. Review = 10000
vi. Checkin = 493
vii. Photo = 10000
viii. Tip = 3979 (business_id)
ix. User = 10000
x. Friend = 11
xi. Elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.



3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

	Answer: no


	SQL code used to arrive at answer:
  select id
, name, review_count, yelping_since, useful, funny, cool, fans, average_stars
, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos

from user
where id = NULL or name = NULL or review_count = NULL or yelping_since = NULL or useful = NULL or funny = NULL or cool = NULL or fans= NULL or average_stars= NULL or compliment_hot= NULL or compliment_more= NULL or compliment_profile= NULL or compliment_cute= NULL or compliment_list= NULL or compliment_note= NULL or compliment_plain = NULL or compliment_cool= NULL or compliment_funny= NULL or compliment_writer= NULL or compliment_photos= NULL




4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

	i. Table: Review, Column: Stars

		min: 1		max: 5		avg: 3.7082


	ii. Table: Business, Column: Stars

		min: 1.0		max: 5.0		avg: 3.6549


	iii. Table: Tip, Column: Likes

		min: 0		max: 2		avg: 0.0144


	iv. Table: Checkin, Column: Count

		min: 1		max: 53		avg: 1.9414


	v. Table: User, Column: Review_count

		min: 0		max: 2000		avg: 24.2995



5. List the cities with the most reviews in descending order:

SQL code used to arrive at answer:
select
city,
review_count
from business
order by review_count desc


	Copy and Paste the Result Below:
+------------+--------------+
| city       | review_count |
+------------+--------------+
| Las Vegas  |         3873 |
| Montréal   |         1757 |
| Gilbert    |         1549 |
| Las Vegas  |         1410 |
| Las Vegas  |         1389 |
| Las Vegas  |         1252 |
| Las Vegas  |         1116 |
| Las Vegas  |         1084 |
| Las Vegas  |          961 |
| Gilbert    |          902 |
| Las Vegas  |          864 |
| Scottsdale |          823 |
| Las Vegas  |          821 |
| Las Vegas  |          786 |
| Henderson  |          785 |
| Toronto    |          778 |
| Las Vegas  |          768 |
| Las Vegas  |          758 |
| Scottsdale |          726 |
| Cleveland  |          723 |
| Las Vegas  |          720 |
| Charlotte  |          715 |
| Phoenix    |          711 |
| Las Vegas  |          706 |
| Phoenix    |          700 |
+------------+--------------+



6. Find the distribution of star ratings to the business in the following cities:

i. Avon

SQL code used to arrive at answer:
select
stars,
count(stars) as count
from business
where city = 'Avon'
group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   1.5 |     1 |
|   2.5 |     2 |
|   3.5 |     3 |
|   4.0 |     2 |
|   4.5 |     1 |
|   5.0 |     1 |
+-------+-------+


ii. Beachwood

SQL code used to arrive at answer:
select
stars,
count(stars) as count
from business
where city = 'Beachwood'
group by stars


Copy and Paste the Resulting Table Below (2 columns – star rating and count):
+-------+-------+
| stars | count |
+-------+-------+
|   2.0 |     1 |
|   2.5 |     1 |
|   3.0 |     2 |
|   3.5 |     2 |
|   4.0 |     1 |
|   4.5 |     2 |
|   5.0 |     5 |
+-------+-------+



7. Find the top 3 users based on their total number of reviews:

	SQL code used to arrive at answer:
select
stars,
count(stars) as count
from business
where city = 'Beachwood'
group by stars


	Copy and Paste the Result Below:
	+--------+--------------+
	| name   | review_count |
	+--------+--------------+
	| Gerald |         2000 |
	| Sara   |         1629 |
	| Yuri   |         1339 |
	+--------+--------------+



8. Does posing more reviews correlate with more fans?

	Please explain your findings and interpretation of the results:
	Posing more reviews does not correlate with more fans. By sorting review counts for each user and listing their fans number, we cannot see a trend of fans number. This may indicate that the main motivation for the user to write review has little to do with their fans number.



9. Are there more reviews with the word "love" or with the word "hate" in them?

	Answer: Yes. There are 1780 reviews with "love" while there are 232 reviews with  "hate".


	SQL code used to arrive at answer:
	select
	count as love_count
	from review
	where text like '%love%'

	select
	count(text) as hate_count
	from review
	where text like '%hate%'



10. Find the top 10 users with the most fans:

	SQL code used to arrive at answer:
	select
	name,
	fans
	from user
	order by fans desc
	limit 10

	Copy and Paste the Result Below:
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       |  503 |
| Mimi      |  497 |
| Harald    |  311 |
| Gerald    |  253 |
| Christine |  173 |
| Lisa      |  159 |
| Cat       |  133 |
| William   |  126 |
| Fran      |  124 |
| Lissa     |  120 |
+-----------+------+




Part 2: Inferences and Analysis

1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.

i. Do the two groups you chose to analyze have a different distribution of hours?
Yes. I chose Las Vegas and the food category. The place with 4 stars opens from 10:00-19:00 and the place with 2.5 stars opens from 8:00-22:00.

ii. Do the two groups you chose to analyze have a different number of reviews?
Yes. The one with 4 stars has 30 reviews while the on with 2 stars have 6 reviews.

iii. Are you able to infer anything from the location data provided between these two groups? Explain.
Not really. These two places have different address and postal code.

SQL code used for analysis:
select
b.name,
b.city,
c.category,
b.stars,
h.hours,
b.review_count,
b.address,
b.postal_code
from (business b inner join category c on c.business_id = b.id)
inner join hours h on h.business_id = c.business_id
where b.city like 'las vegas' and c.category like 'food'
group by name

+-----------------------------+-----------+----------+-------+----------------------+--------------+-----------------------------+-------------+
| name                        | city      | category | stars | hours                | review_count | address                     | postal_code |
+-----------------------------+-----------+----------+-------+----------------------+--------------+-----------------------------+-------------+
| Sweet Ruby Jane Confections | Las Vegas | Food     |   4.0 | Saturday|10:00-19:00 |           30 | 8975 S Eastern Ave, Ste 3-B | 89123       |
| Walgreens                   | Las Vegas | Food     |   2.5 | Saturday|8:00-22:00  |            6 | 3808 E Tropicana Ave        | 89121       |
+-----------------------------+-----------+----------+-------+----------------------+--------------+-----------------------------+-------------+


2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.

i. Difference 1:
Business that are open has higher average stars and higher review counts than business that re closed.

ii. Difference 2:
Business that are open has a higher count of positive reviews (containing useful, funny or cool) than business that are closed.

SQL code used for analysis:
select
b.is_open,
avg(b.stars) as average_stars,
avg(b.review_count) as average_review,
count(r.useful) + count(r.funny) + count(r.cool) as positive_reviews
from business b
inner join review r on r.id = b.id
group by b.is_open

+---------+---------------+----------------+------------------+
| is_open | average_stars | average_review | positive_reviews |
+---------+---------------+----------------+------------------+
|       0 |           2.0 |            4.0 |                3 |
|       1 | 2.96153846154 |  38.7692307692 |               39 |
+---------+---------------+----------------+------------------+


3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:

i. Indicate the type of analysis you chose to do:


ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:


iii. Output of your finished dataset:


iv. Provide the SQL code you used to create your final dataset:
