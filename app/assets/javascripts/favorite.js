class Favorite {
    constructor(obj) {
        this.user_id = obj.user_id;
        this.campsite_id = obj.campsite.id
    }
}


function createFovorite(e) {
    e.preventDefault();
    console.log(e.target.id);
    let url = window.location.pathname;
    let user_id = currentUser();
    console.log (`user_id in create fav is ${user_id}`)

    let favorite = {
        user_id: user_id,
        campsite_id: e.target.id
    }

    fetch(`${baseUrl}favorites`, {
        method: 'post',
        headers: {
            'Accept': 'application/json, text/plain, */*',
            'Content-Type': 'application/json'
        },
            body: JSON.stringify(favorite)
        }).then(() => {
            clearData();
            listCamps(); // how to avoid rerendering the whole div?
    });
}

function displayFavorites() {
    const url = baseUrl + "favorites";
    const ul =  $('#fetch-data');

    fetch(url)
    .then (response => response.json())
    .then(data => {
        console.log(data);
        clearData();
        let favs = data;
        ul.append(favsHeading(favs));
        return favs.map(obj => {
        let currentFavCamp = new Campsite(obj.campsite);
        var parser = new DOMParser();
        var html = parser.parseFromString(currentFavCamp.favCampHTML(), 'text/html');    
        ul.append(html.body.firstChild);
        })
    })
}

function favsHeading(data) {
    if(data.length) {
        return (`
        <div class="block">
            <h4 class="title is-4">Your favorite campsites are:</h4>
        </div>
        `)
    } else {
        return (`
        <div class="block">
            <h4 class="title is-4">You have no favorites, yet!</h4>
        </div>
        `)
    }
}
