import { getConnection } from "./../database/database";

const getLanguages = async (request, response) => {
    
    try {
    
        const connection = await getConnection();
        const result = await connection.query ("SELECT id, nombres, apellidos, ciudad, cel FROM usuarios_detalles");
        //console.log(result);
        response.json(result);

    } catch(error){

        response.status(500);
        response.send(error.message);
    
    }   

};

const getLanguage = async (request, response) => {
    
    try {
        console.log(request.params);
        const { id } = request.params;
        const connection = await getConnection();
        const result = await connection.query ("SELECT id, nombres, apellidos, ciudad, cel FROM usuarios_detalles WHERE id = ?", id);
        //console.log(result);
        response.json(result);

    } catch(error){

        response.status(500);
        response.send(error.message);
    
    }   

};

const addLanguages = async (request, response) => {
    
    try {

        const { nombres, apellidos, ciudad, cel } = request.body;
        const language = { nombres, apellidos, ciudad, cel };
        const connection = await getConnection();
        await connection.query ("INSERT INTO usuarios_detalles SET ?", language);
        response.json({ message:"New user created" });

    } catch(error){

        response.status(500);
        response.send(error.message);
    
    }

};

const deleteLanguage = async (request, response) => {
    
    try {
        const { id } = request.params;
        const { nombres, apellidos, ciudad, cel } = request.body;

        if(id===undefined || nombres===undefined || apellidos===undefined || ciudad===undefined || cel===undefined)  {
            response.status(400).json({message:"Bad request, please fill all fields."});
        }
        
        const language = { id, nombres, apellidos, ciudad, cel };
        const connection = await getConnection();
        const result = await connection.query ("DELETE FROM usuarios_detalles WHERE id = ?", language);
        //console.log(result);
        response.json(result);

    } catch(error){

        response.status(500);
        response.send(error.message);
    
    }   

};

const updateLanguage = async (request, response) => {
    
    try {
        const { id } = request.params;
        const { nombres, apellidos, ciudad, cel } = request.body;        

        if(id===undefined || nombres===undefined || apellidos===undefined || ciudad===undefined || cel===undefined)  {
            response.status(400).json({message:"Bad request, please fill all fields."});
        }

        const language = { id, nombres, apellidos, ciudad, cel };
        const connection = await getConnection();
        const result = await connection.query ("UPDATE usuarios_detalles SET ? WHERE id = ?", [language, id]);
        //console.log(result);
        response.json(result);

    } catch(error){

        response.status(500);
        response.send(error.message);
    
    }   

};

export const methods = {
    getLanguages,
    getLanguage,
    addLanguages,
    deleteLanguage,
    updateLanguage
};
