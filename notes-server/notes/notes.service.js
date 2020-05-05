module.exports = {
    createNote,
    getNote,
    getNotes,
    updateNote,
    deleteNote,
    uploadFile
};

class Note {
    id = 0;
    name = "";
    description = "";
}

let notes = [];
let nextId = () => notes.length++;

async function createNote(noteData) {
    let note = new Note();
    note.id = nextId();
    note.name = noteData.name;
    note.description = noteData.description;
    notes[note.id] = note;
    return note;
}

async function getNote(noteId) {
    return notes[noteId];
}

async function getNotes() {
    return notes;
}

async function updateNote(input) {
    const note = notes[input.noteId];
    if (note) {
        note.name = input.noteData.name;
        note.description = input.noteData.description;
    }
    return note;
}

async function deleteNote(noteId) {
    return notes.splice(noteId, 1);
}

async function uploadFile(req, res) {
    try {
        if(req.body.length <= 0) {
            res.send({
                status: false,
                message: 'No file uploaded'
            });
        } else {
            res.send({
                status: true,
                message: 'File is uploaded',
                data: {
                    mimetype: req.headers['content-type'],
                    size: req.body.length
                }
            });
        }
    } catch (err) {
        res.status(500).send(err);
    }
}