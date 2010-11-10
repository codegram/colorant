# colorist

Colorist is a small utility to determine which colors are present in a
particular image, and how much they appear. It wraps ImageMagick's `convert`
command, so it has to be installed on the system.

## Usage

Just put it in your Gemfile:

    gem "colorist"

And wherever you want, you only need a filename, and you get an array of color
percentual frequencies of your image.

    Colorist.process "path/to/my/leaves.jpg"
    # => [["Brown", 78.95], ["Green", 3.85], ...]

These are other options you can specify:

    Colorist.process "file", :colors => 5,      # Default is 8
                             :depth => 24,      # Default is 16
                             :extended => true  # Use more accurate color names

    # => [["Vanilla Brown", 78.95], ["Lime Green", 3.85], ...] (up to 5 colors)

## Command Line Usage

You can also use colorist from the command line. It is simple:

    gem install colorist
    colorist path/to/my/photo.jpg --colors 9 --extended

And the output:

      Cocoa Brown		-- 40.54 %
      Moccaccino Red		-- 17.88 %
      Rock Brown		-- 12.76 %
      ... 

The options you can use are the same as the above explained, just with the
CLI-like format.

## Note on Patches/Pull Requests
 
* Fork the project.
* Make your feature addition or bug fix.
* Add specs for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  If you want to have your own version, that is fine but bump version
  in a commit by itself I can ignore when I pull.
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2010 Codegram. See LICENSE for details.
