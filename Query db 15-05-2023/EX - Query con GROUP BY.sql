1. Contare quanti iscritti ci sono stati ogni anno

SELECT COUNT(`id`) AS `number_student_foryear`, YEAR(`enrolment_date`) AS `Year`
FROM `students`
GROUP BY YEAR(`enrolment_date`);


2. Contare gli insegnanti che hanno l ufficio nello stesso edificio

SELECT COUNT(`id`) AS `number_teacher_sameaddress`, `office_address`
FROM `teachers` 
GROUP BY `office_address`

3. Calcolare la media dei voti di ogni appello d esame


4. Contare quanti corsi di laurea ci sono per ogni dipartimento