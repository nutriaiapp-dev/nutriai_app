import { Router } from "express";
import { getUsers, createUser, updateUser, deleteUser, getUser } from '../controllers/users.controller.js'

const router = Router()

router.get('/users', getUsers);

router.get('/user/:id', getUser);

router.post('/users', createUser);

router.patch('/user/:id', updateUser);

router.delete('/user/:id', deleteUser);

export default router