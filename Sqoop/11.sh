hadoop fs -rmr /h1boutput/Question11
hadoop fs -mkdir -p /h1boutput/Question11
hadoop fs -cp /h1boutput/pig/question10/p* /h1boutput/Question11/
mysql -u root -p'1234' -e "drop database question11;create database if not exists question11;use question11;create table question11(job_title varchar(100),success_rate float,petitions int);"
sqoop export --connect jdbc:mysql://localhost/question11 --username root --password '1234' --table question11 --update-mode allowinsert  --export-dir /h1boutput/Question11/p* --input-fields-terminated-by '\t' ;
echo -e '\n\nDisplay contents from MySQL Database.\n\n'
echo -e '\n10) Which are the top 10 job positions that have  success rate more than 70% in petitions and total petitions filed more than 1000?\n\n'
mysql -u root -p'1234' -e "select * from question11.question11 order by success_rate desc;"

