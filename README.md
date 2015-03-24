# CS Degree Advisor and Planning Assistant
[![Build Status](http://162.243.137.213/buildStatus/icon?job=cs-degree-advisor-master)](http://162.243.137.213/job/cs-degree-advisor-master/)

This Project uses Ruby version 2.1.1, Rails version 4.2.0, Bundler version 1.8.3.
Please note the following:
* Later versions may or may not work with this project, but are untested.
* Ruby 1.9.x and earlier, and Rails 3.2 and earlier, are known to be incompatible with this project.
* Ruby 2.0.0 to 2.1.0 and Rails 4.0.0 to 4.1.9 will probably work but are untested. **__If you use these versions, you do so at your own risk.__**
* Bundler 1.8.3 is the only version tested with this product and known to be compatible.

## How To Run Locally
### Install Ruby, Rails & Bundler
#### Ruby
###### on Windows
See [RubyOnRails.org's download page](http://rubyonrails.org/download/) for details on installing Ruby on Windows.
They navigate you to [rubyinstaller.org](http://rubyinstaller.org/) but the followup details at RubyOnRails.org are important, too.


###### on Mac and Ubuntu
See [GoRails.com's walkthrough](https://gorails.com/setup/osx/10.10-yosemite) for how to install on Mac OS X 10.10 & 10.9, or Ubuntu.
The Mac instructions use [Homebrew](http://brew.sh/) paired with [rbenv](https://github.com/sstephenson/rbenv).
The Ubuntu instructions use apt-get and your choice of [rbenv](https://github.com/sstephenson/rbenv) or [rvm](https://rvm.io/)


###### Other OSs
For operating systems not listed, we haven't researched nor do we know the capabilities for getting Ruby on Rails installed.

#### Rails
Once you have Ruby installed, you need to install Rails using the following command:
`gem install rails`

#### Bundle
Before you run any bundle commands you need to install [Bundler](http://bundler.io/) by running
`gem install bundle`


### Clone the repository

`git config http.sslVerify false`
And add `--global` if you're accessing numerous repositories on Gouda.

#### If you just want to run the project
From the desired directory on your computer, run this command to clone the project:
`git -c http.sslVerify=false clone https://gouda.msudenver.edu/gitlab/falcon/cs-degree-advisor-and-planning-assistant.git`
`cd cs-degree-advisor-and-planning-assistant`

Note that Gouda doesn't allow SSH connection and the SSL cert doesn't work well with Gitlab so the `-c http.sslVerify=false` is important.

You can also just download the source code from this page.

### Install Dependancies
Make sure you are in the correct directory where the project lives.  Now install all the gem dependancies using bundle.

`bundle install`

It may take a couple of minutes if this is your first time installing the dependancies.

### Run a db migration
`bundle exec rake db:migrate`

### Seed the database
`bundle exec rake db:seed`

### Start the rails server
`bundle exec rails s`

### Navigate to the web application
Open up a web browser and navigate to localhost:3000 to see the application.
You should see an example course plan if you have seeded the database with the
command above.

## Running the tests
You can run all the tests for the rails application locally by executing the following command.
`bundle exec rake test`

#### If you want to contribute to this project
You should fork the Falcon repo and clone your fork instead. You can find a "Fork" button near the top right of this page.
Clone using the same command as above, replacing 'falcon' with your username.
To commit changes, make a merge request to Falcon/master from your fork and branch with the desired changes.

#### Caveat for Windows users
If you happen to be working on windows, you might run into into this error:
`SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed`
If this happens download this file [AddTrustExternalCARoot-2048.pem](https://raw.githubusercontent.com/rubygems/rubygems/master/lib/rubygems/ssl_certs/AddTrustExternalCARoot-2048.pem)
and pasted into yourrubypath\lib\ruby\2..\rubygems\ssl_certs
Then re-run `bundle install`
Once that is done executing run `bundle update`

### Configure rails secret keys
**The secrets.yml file is currently included in the project, setting it up can be skipped until further notice.**
Run the following command and copy the output to your clipboard
`RAILS_ENV=development rake secret`
Create new file at `config/secrets.yml` and paste the following, substituting
the output of the previous command output for SECRET_KEY
```
development:
    secret_key_base: SECRET_KEY
```
Now do the same for the test environment
`RAILS_ENV=test rake secret`
Create new file at `config/secrets.yml` and paste the following, substituting
the output of the previous command output for SECRET_KEY
```
test:
    secret_key_base: SECRET_KEY
```