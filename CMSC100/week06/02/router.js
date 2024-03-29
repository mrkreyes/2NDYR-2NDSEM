import {homepage} from './controller.js'

const router = (app) =>{
    app.get('/', homepage)
}

export default router;