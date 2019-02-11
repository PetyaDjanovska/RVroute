class Favorite {
    constructor(obj) {
        this.user_id = obj.user_id;
        this.campsite_id = obj.campsite.id
    }
}

function createFovorite(e) {
    e.preventDefault();
    console.log(e.target.id);
    let favorite = {
    //     user_id = //current_user.id
        campsite_id = e.target.id
    }
}