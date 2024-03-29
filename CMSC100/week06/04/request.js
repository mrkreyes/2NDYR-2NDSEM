import needle from 'needle';

needle.get('http://localhost:3000/', (err, res) =>{
   console.log(res.body)
})

needle.get('http://localhost:3000/find-students-by-fname?fname=Fermin', (err, res) =>{
   console.log(res.body)
})

needle.post('http://localhost:3000/add-student', {
    stdnum: "1010",
    fname: "Elizabeth",
    lname: "Windsor",
    age: 98
}, (err, res) =>{
    console.log(res.body)
})

// needle.post('http://localhost:3000/add-book', 
// {bookName: "Harry Potter and the Philosopher's Stone", 
// isbn: "978-0-7475-3269-9",
// author: "J.K. Rowling",
// yearPublished: "1987"}, 
// (err,res)=>{
//     console.log(res.body);
// })