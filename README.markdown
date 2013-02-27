When Files Change
=================

Do something when files change, it's that simple.

When files change, run my tests:

    when-files-change -- rake test

When files change, build my css assets:

    when-files-change -- make

When files change, make me a sandwich:

    when-files-change -- sudo make-me-a-sandwhich
    
By default `when-files-change` ignores log folders, hidden files in your root, and source control directories.  You can explicitly list any other files you want to ignore:

    when-files-change --ignore 'build' -- make

To quit press CTRL-D or CTRL-C.  To force the command to be run, press Enter.

That's about all there is to it.  Most of the credit for this tool goes to the [guard/listen](https://github.com/guard/listen) library since it does all leg work.  `when-files-change` just wraps it in an easy to use command.

Used with a build tool like Rake, Make, or some other *ake, you can save yourself a lot of time and hassle.  If this doesn't suit your needs, take a look at [Guard](https://github.com/guard/guard) or [Watchr](https://github.com/bevry/watchr), both projects allow special rules for processing various types of events.

Installation
------------

Install `when-files-change` with rubygems:

    gem install when-files-change

-----

Adam Sanderson, http://www.monkeyandcrow.com