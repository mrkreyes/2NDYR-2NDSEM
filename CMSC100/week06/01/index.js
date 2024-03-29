import express from 'express';

const app = express();
app.get('/', (req, res)=>{
    res.send("Welcome to Homepage (1)")
})

app.listen(3000, ()=>{
    console.log('Server is listening to PORT 3000');
});