# Samples and slides for Oracle PL/SQL Unit testing with ruby-plsql-spec

## Introduction ##
Here I'm maintaining some materials related to my talk given at
[BGOUG Fall conference on 20 Nov 2015](http://www.bgoug.org/en/events/details/95.html):
*Oracle PL/SQL Unit testing with ruby-plsql-spec*

It's about unit testing and TDD using Ruby, RSpec, ruby-plsql and ruby-plsql-spec

## Presentation Slides
[Oracle PL-SQL unit testing with ruby-plsql-spec.pptx](Oracle PL-SQL unit testing with ruby-plsql-spec.pptx)

## Demo project
To run it:
 * Install Ruby
 * Setup your test schema: you may use `setup_test_user.sql` for the purpose
 * Copy `spec/database.yml.sample` to `spec/database/.yml`. Modify accordingly
 * From the project directory run

   ``` bash
   bundle install
   rake
   ```
 * To trigger the build & tests when files are changed (monitored paths are configured in [Guardfile](Guardfile) - you can run `guard`

### Setup and configuration files

 * [Gemfile](Gemfile) - dependencies
 * [Rakefile](Rakefile) - Rake build file. Has tasks for source deployment and running tests
 * [deploy.list](deploy.list) - list of database objects to be deployed.
 * [src](src) - database source files are under [src](src)
 * [setup.rb](setup.rb) - simple utility used by Rakefile to deploy [deploy.list](deploy.list)
 * [Guardfile](Guardfile) - Guard configuration file for triggering the build whenever files are saved
 * [spec/database.yml](spec/database.yml) - specify database connection details here

