-- use library_31_01_24;


SELECT  pub_name , publishers.pub_id
from  publishers join titles ON publishers.pub_id = titles.pub_id
WHERE type like "business" or  type like "psychology";
