const express = require('express');
const app = express();
const con = require('./db');
const bcrypt = require('bcrypt');
const { raw } = require('mysql2');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));


app.post('/register', (req, res) => {
    const { username, password, email } = req.body;
    const sql = 'INSERT INTO user (username,email, password) VALUES(?,?,?)';
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
            return res.status(500).send('Hash error');
        }
        con.query(sql, [username, email, hash], (err) => {
            if (err) {
                return res.status(500).send('Database error');
            }
            res.status(200).send('Insert done');
        });
    });
});

app.post("/login", (req, res) => {
    const { username, password } = req.body;
    const sql = "SELECT user_id, password, role FROM user WHERE username = ?";
    con.query(sql, [username], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: "Database server error" });
        }
        if (results.length !== 1) {
            return res.status(401).json({ error: "Wrong username" });
        }

        bcrypt.compare(password, results[0].password, (err, same) => {
            if (err) {
                console.error(err);
                return res.status(500).json({ error: "Authentication server error" });
            }
            if (same) {
                return res.status(200).json({
                    message: "Login successful",
                    user_id: results[0].user_id,
                    role: results[0].role
                });
            } else {
                return res.status(401).json({ error: "Wrong password" });
            }
        });
    });
});

app.get("/getAsset/:cartype", (req, res) => {
    const cartype = req.params.cartype
    const sql = "SELECT * FROM `assetlist` WHERE car_type = ?";
    con.query(sql, [cartype], (err, results) => {
        if (err) {
            console.error(err);
            return res.status(500).json({ error: "Database server error" });
        }
        // console.log(results);
        return res.status(200).json(results);
    })
});

app.get("/dashboard", (req, res) => {
    const sql = "SELECT s.status AS car_status, COUNT(a.car_status) AS status_count FROM (SELECT 'Available' AS status UNION ALL SELECT 'Unavailable' UNION ALL SELECT 'Rent' UNION ALL SELECT 'Pending') AS s LEFT JOIN  assetlist a ON s.status = a.car_status GROUP BY s.status";
    con.query(sql, (err,results)=>{
        if (err) {
            console.error(err);
            return res.status(500).json({ error: "Database server error" });
        }
        // console.log(results);
        return res.status(200).json(results);
    });
});

app.listen(3000, () => {
    console.log("Server is running");
})