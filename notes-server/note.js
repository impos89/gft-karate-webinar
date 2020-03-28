let express = require("express");
let hateoasLinker = require('express-hateoas-links');
let app = express();
app.use(express.json());
app.use(hateoasLinker)

const url = 'http://127.0.0.1/notes/'

class Note {
    id = 0
    name = ""
    description = ""
}

let notes = []
let nextId = () => notes.length++;



app.listen(3000, () => {
    console.log("Server running on port 3000");
})

app.get("/notes/:noteId", (req, res, next) => {
    const note = notes[req.params.noteId]
    if (note) {
        res.json(notes[req.params.noteId], defaultLinks(note.id))
    } else {
        res.sendStatus(404);
    }
});


app.get("/notes", (req, res, next) => {
    res.json(notes, [
        { rel: "self", method: "GET", href: url },
        { rel: "create", method: "POST", title: 'Create Note', href: url }
    ]);
});

app.post("/notes", (req, res, next) => {
    let note = new Note()
    note.id = nextId()
    note.name = req.body.name
    note.description = req.body.description
    notes[note.id] = note
    res.json(notes[note.id], defaultLinks(note.id))
});

app.put("/notes", (req, res, next) => {
    let note = new Note()
    note.id = nextId()
    note.name = req.body.name
    note.description = req.body.description
    notes[note.id] = note
    res.json(notes[note.id])
});

app.delete("/notes/:noteId", (req, res, next) => {
    const index = req.params.noteId
    const note = notes[index]
    notes.splice(index, 1);
    res.json(note)
});

app.put("/notes/:noteId", (req, res, next) => {
    const index = req.params.noteId
    const note = notes[index]
    notes.splice(index, 1);
    res.json(note)
});

let defaultLinks = (noteId) => {

    return [
        { rel: "self", method: "GET", href: url + noteId || '' },
        { rel: "create", method: "POST", title: 'Create Note', href: url },
        { rel: "update", method: "PUT", title: 'Update Note', href: url + noteId || '' },
        { rel: "delete", method: "DELETE", title: 'Delete Note', href: url + noteId || '' }
    ]
}