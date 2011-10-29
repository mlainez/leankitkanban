LeanKitKanban
=============

LeanKitKanban is a simple ruby wrapper around the LeanKitKanban API

http://leankitkanban.com/

Usage
-----

    # configure your account information
    LeanKitKanban::Config.email    = "mytestemail@test.com"
    LeanKitKanban::Config.password = "mypassword"
    LeanKitKanban::Config.account  = "myaccount"

    # get all boards and returns an array of hashes
    @boards      = LeanKitKanban::Board.all

    # get the board with specified id as a hash
    @board       = LeanKitKanban::Board.find(board_id)

    # get all the identifiers for a board, it contains all information needed for other api calls
    @identifiers = LeanKitKanban::Board.get_identifiers(board_id)

    # get the newest version of the board if it exists
    @board_version = LeanKitKanban::Board.get_newer_if_exists(board_id, version_id)

    # gets the last 5 events that occured since version_id
    @last_events   = LeanKitKanban::Board.get_board_history_since(board_id, version_id)


    # get a specific card from a board
    @card = LeanKitKanban::Card.find(board_id, card_id)

    # get a specific card from a board by external id
    @card = LeanKitKanban::Card.find_by_external_id(board_id, external_id)


    # get board backlog
    @backlog = LeanKitKanban::Backlog.fetch(board_id)


    # get board archive
    @archive = LeanKitKanban::Archive.fetch(board_id)

Contributing
------------

Fork this repo and send me pull requests.

All specs are in the /spec directory, to run them:

    rspec

Additional information
----------------------

* LeanKitKanban API doc: http://support.leankitkanban.com/forums/20153741-api

License
-------

Copyright © 28/10/11, mlainez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

The Software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the Software.

Except as contained in this notice, the name of mlainez shall not be used in advertising or otherwise to promote the sale, use or other dealings in this Software without prior written authorization from mlainez.