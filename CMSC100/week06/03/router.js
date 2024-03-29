import {homepage, findStudents, findStudentsByFName} from './controller.js'

const router = (app) =>{
    app.get('/', homepage);
    app.get('/find-students', findStudents)
    app.get('/find-students-by-fname', findStudentsByFName)
}
export default router;