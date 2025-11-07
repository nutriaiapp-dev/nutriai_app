import { pool } from "../database/database.js";

export const getUser = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM tb_usuarios WHERE id = ?", [
      req.params.id,
    ]);
    if (rows.length <= 0)
      return res.status(404).json({
        message: "Usuario no encontrado",
      });
    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({
      message: "Error internal server",
    });
  }
};

export const getUsers = async (req, res) => {
  try {
    const [rows] = await pool.query("SELECT * FROM tb_usuarios");
    res.json(rows);
  } catch (error) {
    return res.status(500).json({
      message: "Error internal server",
    });
  }
};

export const createUser = async (req, res) => {
  const { code, description, price, quantity } = req.body;

  try {
    const [rows] = await pool.query(
      "INSERT INTO tb_usuarios (nombre, email, password, fecha_nacimiento, nivel_actividad, comuna, fecha_registro, sexo, altura_cm, peso_kg) VALUES (?, ?, ?, ?)",
      [code, description, price, quantity]
    );
    res.send({ rows });
  } catch (error) {
    console.error(error);
    res.status(500).send("Error interno del servidor");
  }
};

export const deleteUser = async (req, res) => {
  try {
    const [result] = await pool.query("DELETE FROM tb_usuarios WHERE id = ?", [
      req.params.id,
    ]);

    if (result.affectedRows <= 0)
      return res.status(404).json({
        message: "Usuario no encontrado...",
      });

    res.sendStatus(204);
  } catch (error) {
    return res.status(500).json({
      message: "Error internal server",
    });
  }
};

export const updateUser = async (req, res) => {
  try {
    const { id } = req.params;
    const { code, description, price, quantity } = req.body;
    const [result] = await pool.query(
      "UPDATE tb_usuarios SET code = IFNULL(?, code), description = IFNULL(?, description), price = IFNULL(?, price), quantity = IFNULL(?, quantity) WHERE id = ?",
      [code, description, price, quantity, id]
    );
    console.log(result);

    if (result.affectedRows === 0)
      return res.status(404).json({
        message: "product not found",
      });

    const [rows] = await pool.query("SELECT * FROM tb_usuarios WHERE id = ?", [
      id,
    ]);

    res.json(rows[0]);
  } catch (error) {
    return res.status(500).json({
      message: "Error internal server",
    });
  }
};
