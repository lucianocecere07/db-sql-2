-- db-sql-2 GROUP BY
--1. Contare quanti iscritti ci sono stati ogni anno
--SELECT COUNT(*) AS 'numero_iscritti', YEAR(enrolment_date) AS 'anno_iscrizione' FROM students GROUP BY YEAR(enrolment_date);

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
--SELECT COUNT(*) AS 'numero_insegnanti', teachers.office_address FROM teachers GROUP BY teachers.office_address;

--3. Calcolare la media dei voti di ogni appello d'esame
--SELECT exam_student.exam_id, COUNT(*) AS 'numero_di_voti', AVG(exam_student.vote) AS 'media_voto' FROM exam_student GROUP BY exam_student.exam_id;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
--SELECT degrees.department_id, COUNT(*) AS 'numero_corsi_dipartimento' FROM degrees GROUP BY degrees.department_id;