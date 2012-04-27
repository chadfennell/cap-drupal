This cap script was inspired by the one listed here (contains a discussion of "why use capistrano"): 

http://www.metaltoad.com/blog/capistrano-drupal-deployments-made-easy-part-1

"cap-drupal" is an example deployment script that demonstrates a very simple single site capistrano deployment script that uses Drush Make.

Installation: 

1. Install the gems.

gem install capistrano
gem install capistrano-ext
gem install railsless-deploy

2. Configure the environments.

2.1 Copy config/deploy/example.staging.rb to:

config/deploy/development.rb
config/deploy/staging.rb
config/deploy/production.rb

2.2 Edit the development.rb, staging.rb, and production.rb to reflect your server setup.

3. Create the app directory (the parent direcotry that holds your drupal code, file assets, configuration and other directories).

3.1 e.g. "/var/www/your.app/"

4. Run the Capistrano setup task.

4.1 e.g. "cap staging deploy:setup"

5 Set up the "releases" directory.

5.1 Set an SGID on your app "releases" directory so all users of a given group may edit all deployed files by default, regardless of which user made a particular deployment.

5.2 For more info on SGID see http://www.library.yale.edu/wsg/docs/permissions/sgid.htm

5.3 e.g. "chmod g+rws /var/www/your.app/"

6 Set up the "shared" directory.

6.1 Configure your Drupal default directory and settings.ph file in the generated "shared" directory.

6.2 Create your settings.php and place it in the /path/to/your.app/shared/default directory.
 
6.3 Create the files directory.

6.3.1 cap-drupal defaults to a file directory located under "/path/to/your.app/shared/default/files".

6.3.1.1 You may choose to locate this directory elsewhere and linking to it within the ":symlink" task in your deployment scripts.

7. Point your apache configuration to the "current" directory under your application root. e.g: 

DocumentRoot /var/www/your.app/current"
<Directory "/var/www/your.app/current">

8. Run your deploy command (e.g. "cap staging deploy").