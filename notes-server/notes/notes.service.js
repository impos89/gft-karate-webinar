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

async function updateNote(noteToUpdate) {
    const note = notes[noteToUpdate.id];
    if (note) {
        note.name = noteToUpdate.name;
        note.description = noteToUpdate.description;
    }
    return note;
}

async function deleteNote(noteId) {
    return notes.splice(noteId, 1);
}
