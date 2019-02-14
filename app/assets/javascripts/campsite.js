class Campsite {
    constructor(obj){
        this.id = obj.id;
        this.name = obj.name;
        this.address = obj.address;
        this.description = obj.description;
        this.favorites = obj.favorites
    }

    //Works as a static(class) method
    static campForm() {
        return (`
        <div class="box">
            <form id='new-camp-form'>
                <h4 class="title is-4">Create a new campsite below:</h4>
                <!--name -->
                <div class="block">
                    <input type="text" placeholder="name">
                </div>

                <!--address -->
                <div class="block">
                    <input type="text" placeholder="address">
                </div>

                <!--description -->
                <div class="block">
                    <input type="text" placeholder="description">
                </div>

                <!--submit -->
                <div>
                    <button class="button">Submit</button>
                </div>

            </form>
        </div>
        `)
    }
}

// Works as an instance method
Campsite.prototype.campHTML = function () {
    return (`
    <div class='box'>
        <h4 class="item title is-4" id="${this.id}">${this.name}</h4>
        <h4 class="subtitle">${this.address}</h4>
        <p>${this.description}</p>
        <p>
            ${isFavorite(this)}   
        </p>
    </div>
    <br>
    `)
}

Campsite.prototype.favCampHTML = function () {
    return (`
    <div class='box'>
        <h4 class="item title is-4" id="${this.id}">${this.name}</h4>
        <h4 class="subtitle">${this.address}</h4>
        <p>${this.description}</p>
    </div>
    <br>
    `)
}

function listCamps() {
    const url = baseUrl + "campsites";
    const ul =  $('#fetch-data');

    fetch(url)
    .then (response => response.json())
    .then(data => {
        console.log(data);
        let camps = data;
        return camps.map(obj => {
        let currentCamp = new Campsite(obj);
        var parser = new DOMParser();
        var html = parser.parseFromString(currentCamp.campHTML(), 'text/html');    
        ul.append(html.body.firstChild);
        })
    })
}

function showCamp(id) {
    let url = baseUrl + "campsites/" + id;
    const ul =  $('#fetch-data');

    fetch(url)
    .then(response => response.json())
    .then(data => {
        let currentCamp = new Campsite(data);
        var parser = new DOMParser();
        var html = parser.parseFromString(currentCamp.campHTML(), 'text/html');    
        ul.append(html.body.firstChild);
    })
}

function newCampForm() {
    clearData();
    $('#fetch-data').append(Campsite.campForm());
    createCamp();
}

function createCamp() {
    $('#new-camp-form').on('submit', function(e) {
        e.preventDefault();

        let camp = {
            name: e.target[0].value,
            address: e.target[1].value,
            description: e.target[2].value
        }
        console.log(camp);

        fetch(`${baseUrl}campsites`, {
			method: 'post',
			headers: {
				'Accept': 'application/json, text/plain, */*',
				'Content-Type': 'application/json'
			},
                body: JSON.stringify(camp)
            }).then(() => {
                clearData();
                listCamps();
		});
    })
}

function isFavorite(camp) {
    let array = camp.favorites;
    let flag = `<button class="button is-small is-primary is-outlined favorite" id=${camp.id}>Add to Favorites</button>`
    let current_user_id = currentUser();

    for (var i in array) {
        if(array[i].user_id == current_user_id) {
            flag = `&hearts; favorite`; 
        }
    }
    return flag;
}