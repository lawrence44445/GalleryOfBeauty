notes important:

there needs to be an "uploads" folder in "public" folder to save photos, and there's need to be a file in the "uploads", any file would work.



### Start the web application!

We're ready to go!  To start, run the following commands one at a time:

1.  Change into the `superwall` directory

    ```bash
    cd superwall 
    ```
1.  Install the `bundle` gem, a Ruby library for managing larger applications

    ```bash
    sudo gem install bundler
    ```
1.  Use bundle to install the libraries that `superwall` needs

    ```bash
    sudo bundle install
    ```
1.  Set up the database that `superwall` uses

    ```bash
    rake db:migrate
    ```
1.  Run the application!

    ```bash
    ruby app.rb
    ```

My computer is set up slightly differently so I don't need to use `sudo`, but this is roughly what you should see:

<p style="text-align: center;">
  <img src="http://f.cl.ly/items/1n070D1X1y1z3O1V1o2A/Screen%20Shot%202014-03-03%20at%202.53.04%20PM.png">
</p>

### Using superwall

At this point you have a real, live web application running on your computer.  Open a browser and go to [http://localhost:4567](http://localhost:4567) and you should see the "Superwall" application.

You can take it from here!  If you want ideas for how to play around with this, visit the [What to work on](http://localhost:4567/todo) section.

## Editing the application

The main application is in the `app.rb` file.  If you want to change the HTML, look in the `templates/` directory.  The main CSS file is located at `public/main.css`, which you can edit.

If you want to add images to your website...

1. Find an image on the web or create it yourself
1. Download it to your computer
1. Name it something sensible like `banner.jpg` or `profile-picture.jpg`.  Spaces and upper-case letters are annoying on the web, so avoid those.
1. Move the image to the `superwall/public/` directory

You can now display the image on your website using the `<img>` tag, like so

```html
<img src="/my-awesome-image.jpg" alt="This is an awesome image!">
```

The forward slash `/` before the image name is important, here.

## Saving your changes to superwall

Coming soon!  The **tl;dr** version is to run these three commands from inside your `superwall` directory:

1. Tell git we want to commit every change we've made — the `.` means "the current directory"

   ```bash
   git add .
   ```
1. Commit your changes with a commit message — the `-m` means "message" and the bit between the quotes is the (required) commit message

   ```bash
   git commit -m "Saving my changes to superwall"
   ```
1. Push your changes to GitHub — you might be prompted for your username and password again

   ```bash
   git push
   ```

## Commands of interest

These are the main commands of interest:

* `rake db:migrate` to run all migrations up to the latest version
* `rake generate:migration NAME="add_foo_to_bar"` to create a timestamp-versioned migration file called “add_foo_to_bar”
* `rake generate:model NAME="User"` to generate a new model call User that lives in models/user.rb
* `rake -T` to list all available rake commands
* `ruby app.rb` to actually run the application

