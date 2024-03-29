import mongoose from 'mongoose';

await mongoose.connect("mongodb://127.0.0.1:27017/ICS", {
    useNewUrlParser: true, useUnifiedTopology: true
})
const Student = mongoose.model("Student", {
    stdnum: Number,
    fname: String,
    lname: String,
    age: Number 
},'students')

const homepage = (req, res) =>{
    res.send("Welcome to Homepage!")
}
const findStudents = async (req, res) =>{
    res.send(await Student.find())
}

const findStudentByFName = async (req, res) =>{
    res.send(await Student.findOne({fname: req.query.fname}))
}

const addStudent = async (req, res) =>{
    if (req.body.stdnum && req.body.fname && req.body.lname && req.body.age){
        const newStudent = new Student(req.body)
        await newStudent.save()
        res.json({success: true});
    }else{
        res.json({success: false});
    }
  
}
export {homepage, findStudents, findStudentByFName, addStudent}