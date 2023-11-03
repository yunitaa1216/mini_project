import express from "express";
import { getData, getDataById, createUser, updateUser, deleteUser, login, logout } from "../controllers/AuthControllers.js";
import { Authentication } from "../middleware/Authenticate.js";

const router = express.Router();

router.get('/',getData);
router.get('/:id', Authentication,getDataById)
router.post('/create', Authentication,createUser)
router.patch('/update/:id', Authentication,updateUser)
router.delete('/delete/:id', Authentication,deleteUser)
router.post('/login', login)
router.delete('/logout', logout)

export default router;