This cap script was inspired by the one listed here: 

http://www.metaltoad.com/blog/capistrano-drupal-deployments-made-easy-part-1

Check out that post for a good overview of the file directory layout for
Capistrano multistage deployment.

Installation: 

1. Install the gems

gem install capistrano
gem install capistrano-ext
gem install railsless-deploy


2. Set up this cap script

2.1 Copy config/deploy/example.staging.rb to:

config/deploy/development.rb
config/deploy/staging.rb
config/deploy/production.rb

2.2 Configure the settings files to match your system

3. Run the setup task

3.1 e.g. "cap staging deploy:setup"

4. Database Setup

4.1 Create two databases for each application (e.g. your_app_db_1,
your_app_db_2) and run GRANT ALL on these to a given user. Import your
data into these databases if you have an existing database.

4.2 Edit the JSON files located in your shared/conf directory of your
app to reflect the credentials you just set for these two databases.
Note: The "database_spare" value should be the name of the other
database.

4.3 Link one of these config files to your shared/default directory as
"db_settings.json". e.g. "ln -s /foo/bar/shared/conf/db_settings_1.json /foo/bar/shared/default/db_settings.json"

What are these for? We always backup whichever database is live and sync
this data to whichever one is not live before running update.php in
order to have a hot spare fallback. JSON is a language-neutral format
that can be read by both the settings.php file and the capistrano
script.

5. Create your settings.php file and replace the database connection
with the following:

$credentials = file_get_contents('/path/to/default/db_settings.json');
$cred = json_decode($credentials);
$db_url = "mysqli://$cred->username:$cred->pass@localhost/$cred->database";

6. Point your apache configuration to the "current" directory under your
application root.

7. Run your deploy command (e.g. "cap staging deploy")
