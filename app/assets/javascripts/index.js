$(function() {
    listenForCamps();
    listenForNewCamp();
    // listenForFavorite();
})


const baseUrl = 'http://localhost:3000/';

function clearData() {
    $('#fetch-data').empty();
}

function listenForCamps () { 
    $('#camps').on('click', function() {
        clearData();
        listCamps();
    })

    // event delegation, so that an event handler can be attached to the newly created element
    $('div').on('click', '.item', function(e){
        clearData();
        console.log(e.target.id);
        showCamp(e.target.id);
    });

    // the button only exists after camp list loads
    $('div').on('click', 'button.favorite', createFovorite);
}

function listenForNewCamp() {
    $('#new_camp').on('click', newCampForm); // pass a reference to a function as a callback, and not the result of function execution
}


