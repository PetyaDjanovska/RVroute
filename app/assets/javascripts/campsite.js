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
        <form id='new-camp-form'>
            <h2>Create a new campsite below:</h2>
            <!--name -->
            <div>
                <input type="text" placeholder="name">
            </div>

            <!--address -->
            <div>
                <input type="text" placeholder="address">
            </div>

            <!--description -->
            <div>
                <input type="text" placeholder="description">
            </div>

            <!--submit -->
            <div>
                <button>Submit</button>
            </div>

        </form>
        `)
    }
}

// Works as an instance method
Campsite.prototype.campHTML = function () {
    return (`
    <div>
        <h3 class="item" id="${this.id}">${this.name}</h3>
        <p>${this.address}</p>
        <p>${this.description}</p>
        <p>
            ${(this.favorites && this.favorites.length) ? `&hearts; favorite` : `<button class="favorite">Add to Favorites</button>`}
        </p>
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
		});
    })
}