# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

campsites = Campsite.create([
    {
        name: 'Brookside',
        address: '4952 Route 32
        Catskill, New York 12414',
        description: 'The campground offers, a swimming pool, two playgrounds, a game room, volley ball, soccer, ½ court basket ball and a trout brook for fishing.'
    },

    {
        name: 'Ace of diamonds',
        address: '84 Herkimer St, Middleville, New York 13406',
        description: 'Open from Apr 1 through Nov 1'
    },

    {
        name: 'Adirondack/1000 Islands',
        address: '6081 NY State Route 3 Natural Bridge, New York 13665',
        description: 'Enjoy our heated indoor pool, camp under towering pines and relax in front of an evening campfire. '
    },

    {
        name: 'Allegany State Park',
        address: '2373 ASP, Route 1, Suite 3 Salamanca, New York 14779',
        description: 'Both areas offer sand beaches, picnic areas, museums, hiking trails and naturalist walks. Walkers and bicycle riders take advantage of the 5 miles of paved trails around Red House.'
    },

    {
        name: 'Allens Campsground',
        address: '16750 Allen Drive Sackets Harbor, New York 13685',
        description: 'A full service Campground and Marina located on beautiful Lake Ontario in Northern New York.'
    },

    {
        name: 'Cattail Creek',
        address:  '3901 Moore\'s Ferry Road Skippers, Virginia 23879',
        description: 'Open all year'
    },

    {
        name: 'Cherrystone Campsing Resort',
        address: '1511 Townfield Dr Cheriton, Virginia 23310',
        description: 'Cherrystone is situated on 300 acres of natural waterfront on the beautiful Chesapeake Bay, and has just about everything you need for a great vacation.'
    },

    {
        name: 'Appalachian Campsites',
        address: '60 Motel Dr Shartlesville, Pennsylvania 19554',
        description: 'Swimming pool, fishing, clubs welcome.'
    },

    {
        name: 'Brialee RV & Tent Park',
        address: 'ASHFORD, Connecticut',
        description: 'Open from Apr 1 through Dec 1. Swimming pool.'
    },

    {
        name: 'Big Biloxi',
        address: '19595 Desoto Park Road Saucier, Mississippi 39574',
        description: 'This fully developed campground is set on the banks of the Big Biloxi River contains 25 campsites'
    },

    {
        name: 'Blackwater Falls State Park',
        address: 'Drawer 490 Davis, West Virginia 26260',
        description: 'Blackwater Falls State Park is named for the falls of the Blackwater River whose amber-colored waters plunge five stories then twist and tumble through an eight-mile long gorge.'
    }
    
])
