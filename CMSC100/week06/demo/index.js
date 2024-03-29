import mongoose from 'mongoose';
await mongoose.connect('mongodb://127.0.0.1:27017/ICS', {useNewUrlParser: true, useUnifiedTopology: true })

const Student = mongoose.model('Student', {
    stdnum: String,
    fname: String,
    lname: String,
    age: Number
}, 'students')

//let data = await Student.findOne({ fname: "Arian", lname: "Jacildo" });
//console.log(data);

let updatedStud = await Student.updateOne(
    {age : 22},
    {$set: {fname: "John"}}
);

// await Student.deleteOne({studnum: 1001})


