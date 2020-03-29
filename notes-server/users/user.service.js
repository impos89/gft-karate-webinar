const users = [
    {
        id: 1,
        username: 'some3ducks',
        password: 'inthezoo',
        firstName: 'Rick',
        surname: 'Astley'
    }
];

module.exports = {
    authenticate,
    getAll
};

async function authenticate({username, password}) {
    const user = users.find(u => u.username === username && u.password === password);
    if (user) {
        const {password, ...userWithoutPassword} = user;
        return userWithoutPassword;
    }
}

async function getAll() {
    return users.map(user => {
        const {password, username, ...userWithoutPassword} = user;
        return userWithoutPassword;
    });
}