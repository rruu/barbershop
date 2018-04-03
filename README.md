Edu project "Barbershop"!
====

[Sinatra](http://www.sinatrarb.com/)
[Twitter Bootstrap](http://getbootstrap.com/)

Go!
===
Download and run barbershop:

    git clone https://github.com/rruu/barbershop

    cd barbershop
    bundle install             # To install sinatra
    rackup    # To run the sample

Then open [http://localhost:9292/](http://localhost:9292/)

Deploy to [Heroku](https://www.heroku.com/)

Heroku deploy
===

    heroku create               # Create app
    git push heroku master      # Pull code to Heroku

TODO
===

    [ ] Fix heroku compatibility (migration sqlite3 => pg)
