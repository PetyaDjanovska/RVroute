class Campsite {
    constructor(obj){
        this.id = obj.id;
        this.name = obj.name;
        this.address = obj.address;
        this.description = obj.description;
    }

    static campForm() {
        // let campForm = (`
        // <form id='new-camp-form'>
        //     <!--name -->
        //     <div>
        //         <input type="text" placeholder="name">
        //     </div>

        //     <!--address -->
        //     <div>
        //         <input type="text" placeholder="address">
        //     </div>

        //     <!--description -->
        //     <div>
        //         <input type="text" placeholder="description">
        //     </div>

        // </form>
        // `)
    }
}

Campsite.prototype.campHTML = function () {
	return (`
		<div>
			<h3 class="item" id="${this.id}">${this.name}</h3>
			<p>${this.address}</p>
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