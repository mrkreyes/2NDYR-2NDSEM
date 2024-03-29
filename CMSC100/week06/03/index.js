import express from 'express';
import router from './router.js';

const app = express();
router(app);
app.listen(3000, ()=>{
    console.log("PORT 3000");

})