-- db-sql-2 JOIN
--1.Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
--SELECT students.name, students.surname, students.registration_number, degrees.name FROM students JOIN degrees ON students.degree_id = degrees.id WHERE degrees.name = 'Corso di Laurea in Economia';

--2.Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze
--SELECT degrees.name, degrees.level, departments.name FROM degrees JOIN departments ON degrees.department_id = departments.id WHERE degrees.level = 'magistrale' AND departments.name = 'dipartimento di neuroscienze';

--3.Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
--SELECT teachers.name, teachers.surname, courses.name FROM teachers JOIN course_teacher ON teachers.id = course_teacher.teacher_id JOIN courses ON course_teacher.course_id = courses.id WHERE teachers.name = 'Fulvio' AND teachers.surname = 'Amato';

--4.Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
--SELECT DISTINCT students.surname, students.name, students.registration_number, degrees.name, degrees.level, departments.name FROM students JOIN exam_student ON students.id = exam_student.student_id JOIN exams ON exam_student.exam_id = exams.id JOIN courses ON exams.course_id = courses.id JOIN degrees ON courses.degree_id = degrees.id JOIN departments ON degrees.department_id = departments.id ORDER BY students.surname, students.name;

--5.Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
--SELECT teachers.surname, teachers.name, courses.name, courses.period, courses.year, degrees.name FROM teachers JOIN course_teacher ON teachers.id = course_teacher.teacher_id JOIN courses ON course_teacher.course_id = courses.id JOIN degrees ON courses.degree_id = degrees.id ORDER BY degrees.name;

--6.Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
--SELECT DISTINCT teachers.name, teachers.surname, departments.name FROM teachers JOIN course_teacher ON course_teacher.teacher_id = teachers.id JOIN courses ON course_teacher.course_id = courses.id JOIN degrees ON courses.degree_id = degrees.id JOIN departments ON degrees.department_id = departments.id WHERE departments.name = 'Dipartimento di Matematica' GROUP BY teachers.name, teachers.surname, departments.name;

--7.BONUS: Selezionare per ogni studente quanti tentativi d'esame ha sostenuto per superare ciascuno dei suoi esami
--SELECT students.surname, students.name, students.registration_number, courses.name, COUNT(courses.name) AS 'numero_di_volte', MAX(exam_student.vote) AS 'voto_massimo_esame' FROM students JOIN exam_student ON students.id = exam_student.student_id JOIN exams ON exam_student.exam_id = exams.id JOIN courses ON exams.course_id = courses.id WHERE exam_student.vote >= 18 GROUP BY students.surname, students.name, students.registration_number, courses.name, exam_student.vote ORDER BY students.registration_number;