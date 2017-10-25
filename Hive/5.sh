rm /home/hduser/project/5.txt
rm /home/hduser/project/5b.txt

hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2011 group by job_title,year  order by temp desc limit 10;" > /home/hduser/project/5.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2012 group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5.txt 
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2013 group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5.txt 
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2014 group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5.txt 
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2015 group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5.txt 
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2016 group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5.txt 

hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2011 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" > /home/hduser/project/5b.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2012 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5b.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2013 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5b.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2014 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5b.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2015 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5b.txt
hive -e "select job_title,year,count(case_status ) as temp from h1b_final where year = 2016 and case_status= 'CERTIFIED' group by job_title,year  order by temp desc limit 10;" >> /home/hduser/project/5b.txt

echo -e "Top 10 Job Titles  for all the applications"
cat -n /home/hduser/project/5.txt
echo -e "\n"
echo -e "Top 10 Job Titles  for all Certified applications"
cat -n /home/hduser/project/5b.txt

