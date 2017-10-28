start-all.sh
show_menu()
{
	
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[32m"` #blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1) ${RED_TEXT} [1(a)] ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2) ${RED_TEXT} [1(b)] ${MENU} Find top 5 job titles who are having highest avg growth in applications.[ALL]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3)  ${RED_TEXT} [2(a)] ${MENU} Which part of the US has the most Data Engineer jobs for each year?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4) ${RED_TEXT} [2(b)] ${MENU} find top 5 locations in the US who have got certified visa for each year.[certified]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5) ${RED_TEXT} [3] ${MENU} Which industry(SOC_NAME) has the most number of Data Scientist positions?
[certified]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6) ${RED_TEXT} [4] ${MENU} Which top 5 employers file the most petitions each year? - Case Status - ALL ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7) ${RED_TEXT} [5] ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?
a) for all the applications
b) for only certified applications.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8) ${RED_TEXT} [6] ${MENU}  Find the percentage and the count of each case status on total applications for each year. Create a line graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9) ${RED_TEXT} [7] ${MENU} Create a bar graph to depict the number of applications for each year [All]${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10) ${RED_TEXT} [8] ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11) ${RED_TEXT} [9] ${MENU} Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed 1000 OR more than 1000) ?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12) ${RED_TEXT} [10] ${MENU} Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed 1000 OR more than 1000)? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13) ${RED_TEXT} [11] ${MENU}Export result for question no 10 to MySql database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}press enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
	while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "1 a)  Is the number of petitions with Data Engineer job title increasing over time?";
		hadoop fs -rmr /h1boutput/mr/Question1a
		hadoop jar h1b.jar Question1a /h1b /h1boutput/mr/Question1a
		echo -e "1  Is the number of petitions with Data Engineer job title increasing over time?\n\n" 
		hadoop fs -cat /h1boutput/mr/Question1a/p*
        show_menu;
        ;;
        2) clear;
        option_picked "1 b) Find top 5 job titles who are having highest avg growth in applications.[ALL]";
		pig -x local /home/hduser/project/Codes/Pig/question1b.pig
        show_menu;
        ;;  
        3) clear;
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		hadoop fs -rmr /h1boutput/mr/Question2a
		hadoop jar h1b.jar Question2a /h1b /h1boutput/mr/Question2a
		hadoop fs -cat /h1boutput/mr/Question2a/p*
		
        show_menu;
        ;;
	    4) clear;
        	option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.[certified]";
	        bash /home/hduser/project/Codes/Hive/2b.sh
        show_menu;
        ;;  
	    5) clear;
        option_picked "3) Which industry(SOC_NAME) has the most number of Data Scientist positions? [certified]";

		hadoop fs -rmr /h1boutput/mr/Question3
		hadoop jar h1b.jar Question3 /h1b /h1boutput/mr/Question3
		hadoop fs -cat /h1boutput/mr/Question3/p*

        show_menu;
        ;;
        6) clear;
        option_picked "4)Which top 5 employers file the most petitions each year? - Case Status - ALL";
		hadoop fs -rmr /h1boutput/mr/Question4
		hadoop jar h1b.jar Question4 /h1b /h1boutput/mr/Question4
		hadoop fs -cat /h1boutput/mr/Question4/p*		
        show_menu;
        ;;
        7) clear;
        option_picked "5)Find the most popular top 10 job positions for H1B visa applications for each year?
			a) for all the applications
			b) for only certified applications.";
	    bash /home/hduser/project/Codes/Hive/5.sh
        show_menu;
        ;;
        8) clear;

		option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a line graph depicting the pattern of All the cases over the period of time.";
		rm -r /home/hduser/project/6
		pig -x local /home/hduser/project/Codes/Pig/question6.pig
		libreoffice /home/hduser/project/6.ods

        show_menu;
        ;;
		9) clear;
		
        option_picked "7) Create a bar graph to depict the number of applications for each year";
		bash /home/hduser/project/Codes/Hive/7.sh
        show_menu;
        ;;
		10) clear;
        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate). Arrange the output in descending order ";
		bash /home/hduser/project/Codes/Hive/8.sh
        show_menu;
        ;;

		11) clear;

		option_picked "9) Which are the employers along with the number of petitions who have the success rate more than 70%  in petitions. (total petitions filed 1000 OR more than 1000) ?";
		hadoop fs -rmr /h1boutput/pig/question9
		pig -x local /home/hduser/project/Codes/Pig/question9.pig
		hadoop fs -cat /h1boutput/pig/question9/p*
        show_menu;
        ;;
		12) clear;
		
		option_picked "10) Which are the  job positions along with the number of petitions which have the success rate more than 70%  in petitions (total petitions filed 1000 OR more than 1000)?";
		hadoop fs -rmr /h1boutput/pig/question10
		pig -x local /home/hduser/project/Codes/Pig/question10.pig
		hadoop fs -cat /h1boutput/pig/question10/p*
        show_menu;		
        ;;
		13) clear;
		option_picked "11) Export result for question no 10 to MySql database.";
	
		bash /home/hduser/project/Codes/Sqoop/11.sh
        show_menu;
        ;;
		\n) exit;   
		;;
        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done

