$(function() {
    listenForCamps();
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
    $(function () {
        $('div').on('click', '.item', function(e){
            clearData();
           console.log(e.target.id);
           showCamp(e.target.id);
        });
    });
}



