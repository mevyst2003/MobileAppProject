const express = require('express');
const app = express();
const con = require('./db');
const bcrypt = require('bcrypt');
const { raw } = require('mysql2');
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.get('/password/:raw', (req, res) => {
    const raw = req.params.raw;
    bcrypt.hash(raw, 10, (err, hash) => {
        if (err) {
            return res.status(500).send('Hash error');
        }
        res.send(hash);
    });
});


app.post('/register', (req, res) => {
    const { username, password } = req.body;
    const sql = 'INSERT INTO users (username, password) VALUES(?,?)';
    bcrypt.hash(password, 10, (err, hash) => {
        if (err) {
            return res.status(500).send('Hash error');
        }
        con.query(sql, [username, hash], (err) => {
            if (err) {
                return res.status(500).send('Database error');
            }

            res.status(200).send('Insert done');
        });
    });
});


app.post('/login', (req, res) => {
    const { username, password } = req.body; 
    const sql = 'SELECT id, password FROM users WHERE username = ?';
    con.query(sql, [username], (err, results) => {
        if (err) {
            console.log(err);
            return res.status(500).send('DB error');
        }
        if (results.length != 1) {
            return res.status(400).send('Wrong username');
        }
        const user = results[0];
        const hash = user.password;
        bcrypt.compare(password, hash, (err, same) => {
            if (err) {
                console.log(err);
                return res.status(500).send('Server error');
            }
            if (same) {
                // Send the user_id as part of the response
                res.json({ message: 'Login OK', user_id: user.id });
            } else {
                res.status(400).send('Wrong password');
            }
        });
    });
});

app.listen(3000, () => {
    console.log("Server is running");
})