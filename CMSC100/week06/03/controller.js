import mongoose from 'mongoose';
await mongoose.connect("mongodb://127.0.0.1:27017/ICS", {
    useNewUrlParser: true, useUnifiedTopology: true
})
const Student = mongoose.model('Student', {
    stdnum: Number,
    fname: String,
    lname: String,
    age: Number
}, 'students')

const homepage = (req,res) =>{
res.send('Welcome to Homepage')
}
const findStudents  = async(req, res) =>{
    res.send(await Student.find())
} 
const findStudentsByFName = async (req, res) =>{
    res.send(await Student.find({fname: req.query.fname}))
}
export {homepage, findStudents, findStudentsByFName}