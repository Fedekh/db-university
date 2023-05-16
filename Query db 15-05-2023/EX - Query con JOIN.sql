1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

SELECT `degrees`.`id`, `students`.`name`, `students`.`surname`,`degrees`.`name`
FROM `degrees`
JOIN `students`
ON `degrees`.`id` = `students`.`degree_id`
WHERE `degrees`.`name` = 'Corso di Laurea in Economia';
-- aggiungo l'id per dare una sorta di ordine



2. Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze

SELECT `departments`.`id`,`degrees`.`name`,`departments`.`name`,`degrees`.`level`
FROM `departments`
JOIN `degrees`
ON `departments`.`id` =`degrees`.`department_id`
WHERE `departments`.`name` LIKE 'Dipartimento di Neuroscienze%'
AND `degrees`.`level` = 'magistrale';



3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

SELECT `teachers`.`id`, `teachers`.`name`, `teachers`.`surname` , `courses`.`name` AS `course_name`
FROM `courses`
JOIN `course_teacher`
ON  `courses`.`id`=`course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`name` = 'Fulvio'
AND `teachers`.`surname` = 'Amato';


4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome

SELECT `students`.`surname`, `students`.`name`, `degrees`.`name` AS `course_name` , `departments`.`name` AS `department_name`
FROM `students`
JOIN `degrees`
ON `degrees`.`id` = `students`.`degree_id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname` ASC, `students`.`name` ASC;


5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

SELECT `degrees`.`name` AS `degree_name` , `courses`.`name` AS `course_name` , `teachers`.`name`, `teachers`.`surname`
FROM `course_teacher`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`



6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) 
SELECT DISTINCT `teachers`.`name` AS `teacher_name` , `teachers`.`surname` AS `teacher_surname`, `departments`.`name` AS `department_name`
FROM `departments` 
JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';


7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per
superare ciascuno dei suoi esami

SELECT `students`.`id`, `students`.`surname` AS `student_surname`, `students`.`name`  AS `student_name`, COUNT(*) AS `failed_attempts`, MAX(`exam_student`.`vote`) AS `max_vote`
FROM `exam_student`
JOIN `students`
ON `exam_student`.`student_id` = `students`.`id`
JOIN `exams`
ON `exams`.`id`= `exam_student`.`exam_id`
JOIN `courses`
ON `exams`.`course_id` = `courses`.`id`
GROUP BY `students`.`id`, `courses`.`id`
HAVING `max_vote` >= 18