# Project Description
Does going to university in a different country affect your mental health? A Japanese international university surveyed its students in 2018 and published a study the following year that was approved by several ethical and regulatory boards.

The study found that international students have a higher risk of mental health difficulties than the general population, and that social connectedness (belonging to a social group) and acculturative stress (stress associated with joining a new culture) are predictive of depression.

Explore the students data using PostgreSQL to find out if you would come to a similar conclusion for international students and see if the length of stay is a contributing factor.


### Instructions
Explore and analyze the students data to see how the length of stay impacts the average mental health diagnostic scores of the international students present in the study.

- Return a table with nine rows and five columns.
- The average columns should contain the average of the PHQ-9 test, SCS test, and ASISS test, columns for each length of stay, rounded to two decimal places.
- The ```count_int``` column should be the number of international students for each length of stay.
- Sort the results by the length of stay in descending order.


| Field Name     | Description                                      |
|----------------|--------------------------------------------------|
| ```inter_dom```      | Types of students (international or domestic)    |
| ```japanese_cate```  | Japanese language proficiency                    |
| ```english_cate```   | English language proficiency                     |
| ```academic```       | Current academic level (undergraduate or graduate)|
| ```age```            | Current age of student                           |
| ```stay```           | Current length of stay in years                  |
| ```todep```          | Total score of depression (PHQ-9 test)           |
| ```tosc```           | Total score of social connectedness (SCS test)   |
| ```toas```           | Total score of acculturative stress (ASISS test) |

<br>
<br>
<br>

And here's a preview of the table

| inter_dom | region | gender | academic | age | age_cate | stay | stay_cate | japanese | japanese_cate | english | english_cate | intimate | religion | suicide | dep | deptype | todep | depsev | tosc | apd | ahome | aph | afear | acs | aguilt | amiscell | toas | partner | friends | parents | relative | profess | phone | doctor | reli | alone | others | internet | partner_bi | friends_bi | parents_bi | relative_bi | professional_bi | phone_bi | doctor_bi | religion_bi | alone_bi | others_bi | internet_bi |
|-----------|--------|--------|----------|-----|----------|------|-----------|----------|---------------|---------|--------------|----------|----------|---------|-----|---------|-------|--------|------|-----|-------|-----|-------|-----|--------|----------|------|---------|---------|---------|----------|---------|-------|--------|------|-------|--------|----------|------------|------------|------------|-------------|-----------------|----------|-----------|-------------|----------|-----------|-------------|
| Inter | SEA | Male | Grad | 24 | 4 | 5 | Long | 3 | Average | 5 | High |  | Yes | No | No | No | 0 | Min | 34 | 23 | 9 | 11 | 8 | 11 | 2 | 27 | 91 | 5 | 5 | 6 | 3 | 2 | 1 | 4 | 1 | 3 | 4 |  | Yes | Yes | Yes | No | No | No | No | No | No | No | No |
| Dom | JAP | Female | Grad | 27 | 5 | 2 | Medium | 3 | Average | 3 | Average | Yes | Yes | No | Yes | Major | 12 | Mod | 47 | 16 | 11 | 5 | 8 | 7 | 3 | 31 | 81 | 7 | 3 | 7 | 1 | 6 | 6 | 1 | 5 | 4 | 1 |  | Yes | No | Yes | No | Yes | Yes | No | Yes | No | No | No |
| Inter | SEA | Male | Grad | 24 | 4 | 5 | Long | 3 | Average | 5 | High |  | Yes | No | No | No | 0 | Min | 34 | 23 | 9 | 11 | 8 | 11 | 2 | 27 | 91 | 5 | 5 | 6 | 3 | 2 | 1 | 4 | 1 | 3 | 4 |  | Yes | Yes | Yes | No | No | No | No | No | No | No | No |
