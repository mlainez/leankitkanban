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

*Running specs*

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