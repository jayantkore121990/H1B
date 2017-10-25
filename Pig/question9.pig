hadoop fs -rmr /h1boutput/pig/question9

register /usr/local/hive/lib/hive-exec-1.2.1.jar
register /usr/local/hive/lib/hive-common-1.2.1.jar
data1 = LOAD 'hdfs://localhost:54310/user/hive/warehouse/h1b_final' USING PigStorage('\t') as (s_no:double,case_status:chararray,employer_name:chararray,soc_name:chararray,job_title:chararray,full_time_position:chararray,prevailing_wage:double,year:chararray,worksite:chararray,longitude,latitude);
cleansed= filter data1 by $1 is not null and $1!='NA';
temp= group cleansed by $2;
total= foreach temp generate group,COUNT(cleansed.$0);
certified= filter data1 by $1 == 'CERTIFIED';
temp1= group certified by $2;
totalcertified= foreach temp1 generate group,COUNT(certified.$0);
certified_with= filter data1 by $1 == 'CERTIFIED-WITHDRAWN';
temp2= group certified_with by $2;
totalcertifiedwithdrawn= foreach temp2 generate group,COUNT(certified_with.$0);
joined= join totalcertified by $0,totalcertifiedwithdrawn by $0,total by $0;
joined= foreach joined generate $0,$1,$3,$5;
intermediateoutput= foreach joined generate $0,(float)($1+$2)*100/($3),$3;
intermediateoutput2= filter intermediateoutput by $1>70 and $2>1000;
finaloutput= order intermediateoutput2 by $1 DESC;
store finaloutput into 'hdfs://localhost:54310/h1boutput/pig/question9' using PigStorage('\t');

hadoop fs -cat /h1boutput/pig/question9/p*
