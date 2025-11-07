import express from 'express';
import bcrypt from 'bcrypt';
import jwt from 'jsonwebtoken';
import { pool } from '../database/database.js';
import crypto from 'crypto';

const router = express.Router();
const JWT_SECRET = 'your_jwt_secret';

// Registro de Usuarios - HASH JWT

export const registerUser = async (req, res) => {

    const { nombre, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password,10);

    try {

        await pool.execute('INSERT INTO tb_usuarios (nombre, email, password) VALUES (?, ?, ?)', [nombre, email, hashedPassword]);
        res.status(201).send('Usuario registrado');

    } catch (error) {

        res.status(500).send('Error registrando usuario');
    }

};

// Login de Usuarios

export const loginUser = async (req, res) => {

    const { email, password } = req.body;

    try {

        const [rows] = await pool.execute ('SELECT * FROM tb_usuarios WHERE email = ?', [email]);
        
        if(rows.length === 0) {

            return res.status(401).send ('Usuario no encontrado');
        
        }

        const user = rows[0];
        const isPasswordValid = await bcrypt.compare(password, user.password);

        if (!isPasswordValid) {

            return res.status(401).send('Password invalido');
        }

        const token = jwt.sign({ id: user.id, nombre: user.nombre }, JWT_SECRET, { expiresIn: '1h' });

        res.json ({ token });

    } catch (error) {

        res.status(500).send('Error iniciando sesion...');
    }
            
};


export default router;



