class User {
    constructor(obj) {
        this.id = obj.id;
        this.name = obj.name;
        this.favorites = obj.favorites;
    }
}

function currentUser() {
    let url = window.location.pathname;
    let user_id = url.substr(url.lastIndexOf('/')+1);
    return user_id;
}