hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2011' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" > /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2011' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" > /home/hduser/project/8n.txt;

hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2012' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2012' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8n.txt;

hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2013' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2013' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8n.txt;

hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2014' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2014' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8n.txt;

hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2015' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2015' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8n.txt;

hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='Y' and year='2016' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8y.txt;
hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_final where full_time_position ='N' and year='2016' and case_status in('CERTIFIED','CERTIFIED-WITHDRAWN') group by job_title,full_time_position,year order by average desc" >> /home/hduser/project/8n.txt;


echo -e "Average with Full-Time Job"
cat /home/hduser/project/8y.txt

echo -e "\n"

echo -e "Average with Part-Time Job"
cat /home/hduser/project/8n.txt
