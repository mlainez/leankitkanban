LeanKitKanban
=============

LeanKitKanban is a simple ruby wrapper around the LeanKitKanban API

http://leankitkanban.com/

[![Build Status](https://travis-ci.org/mlainez/leankitkanban.png?branch=master)](https://travis-ci.org/mlainez/leankitkanban)

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

    # add a card, specified in JSON, to the board
    @response = LeanKitKanban::Card.add(board_id, lane_id, position, body)

    # add multiple cards, specified in JSON, to the board
    @response = LeanKitKanban::Card.add_multiple(board_id, comment, cards)

    # update a card specified in JSON
    @response = LeanKitKanban::Card.update(board_id, body)

    # delete a card from the board
    @response = LeanKitKanban::Card.delete(board_id, card_id)

    # delete multiple cards from the board
    @response = LeanKitKanban::Card.delete_multiple(board_id, card_ids)

    # move a card to another lane
    @response = LeanKitKanban::Card.move(board_id, card_id, lane_id, position)

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


Copyright (c) 2011 Marc Lainez
