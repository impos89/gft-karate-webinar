module.exports = {
    createNote,
    getNote,
    getNotes,
    updateNote,
    deleteNote
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
