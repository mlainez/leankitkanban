LeanKitKanban
=============

LeanKitKanban is a simple ruby wrapper around the LeanKitKanban API

http://leankitkanban.com/

Usage
-----

    LeanKitKanban::Config.email    = "mytestemail@test.com"
    LeanKitKanban::Config.password = "mypassword"
    LeanKitKanban::Config.account  = "myaccount"

    @boards = LeanKitKanban::Board.all # gets all boards and returns an array of hashes
    @board  = LeanKitKanban::Board.find(board_id) # gets the board with specified id as a hash

Board ID
--------

If you want to fetch a specified board from your organization, you'll need the board ID. To get it, log in to leankitkanban, go to that board and check the url. After /Boards you should see a number, that's the board ID.

Contributing
------------

Clone this repo and send pull requests.