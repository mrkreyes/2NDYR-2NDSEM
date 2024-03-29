import {homepage, findStudents, findStudentByFName, addStudent} from './controller.js'

const router = (app) =>{
    app.get('/', homepage);
    app.get('/find-students', findStudents)
    app.get('/find-students-by-fname', findStudentByFName)
    app.post('/add-student', addStudent)
}
export default router;