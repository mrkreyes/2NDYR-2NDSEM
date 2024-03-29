import express from 'express';
import router from './router.js'

const app = express();
router(app);

app.listen(3000, ()=>{
    console.log('Listening to port 3000')
})