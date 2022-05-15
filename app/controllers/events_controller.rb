class EventsController < ApplicationController
    def new
        event = Event.create(
                name: params['event'],
                pic: params['pic'],
                description: params['desc'],
                location: params['loc'],
                start: params['start'].to_datetime,
                end: params['end'].to_datetime,
                password: params['editpass'], #this is fine
                ban_brian: params['brianban']
                )
        event.attendee.create(
            name: params['name'],
            phone_number: params['phone'], #this is also fine
            #figure out api key
        )
    end
end