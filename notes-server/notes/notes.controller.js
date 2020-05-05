require('express-hateoas-links');
const express = require('express');
const router = express.Router();
const notesService = require('./notes.service');

// routes
router.post('/', createNote);
router.get('/:noteId', getNote);
router.get('/', getNotes);
router.put('/:noteId', updateNote);
router.delete('/:noteId', deleteNote);
router.post('/attachment', uploadFile)

module.exports = router;

function createNote(req, res, next) {
    notesService.createNote(req.body)
        .then(note => res.status(200).json(note, defaultLinks(note.id)))
        .catch(err => next(err))

}

function getNote(req, res, next) {
    notesService.getNote(req.params.noteId)
        .then(note => note ?
            res.status(200).json(note, defaultLinks(note.id))
            : res.sendStatus(404))
        .catch(err => next(err));
}

function getNotes(req, res, next) {
    const url = 'http://127.0.0.1/notes/';
    notesService.getNotes()
        .then(notes => {
            res.status(200).json(notes, [
                {rel: "self", method: "GET", href: url},
                {rel: "create", method: "POST", title: 'Create Note', href: url}
            ])
        }).catch(err => next(err));
}

function updateNote(req, res, next) {
    notesService.updateNote({noteId : req.params.noteId, noteData: req.body})
        .then(note => res.status(200).json(note, defaultLinks(note.id)))
        .catch(err => next(err));

}

function deleteNote(req, res, next) {
    notesService.deleteNote(req.params.noteId)
        .then(note => res.status(200).json(note))
        .catch(err => next(err));

}

function uploadFile(req, res, next) {
    notesService.uploadFile(req, res)
        .then(note => res.status(200).json(note))
        .catch(err => next(err))
}

/*
    Generates hateoas links to be included to response body
 */
let defaultLinks = (noteId) => {
    const url = 'http://127.0.0.1/notes/';
    return [
        {rel: "self", method: "GET", href: url + noteId || ''},
        {rel: "create", method: "POST", title: 'Create Note', href: url},
        {rel: "update", method: "PUT", title: 'Update Note', href: url + noteId || ''},
        {rel: "delete", method: "DELETE", title: 'Delete Note', href: url + noteId || ''}
    ]
};