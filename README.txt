This cap script was inspired by the one listed here (contains a discussion of "why use capistrano"): 

http://www.metaltoad.com/blog/capistrano-drupal-deployments-made-easy-part-1

"cap-drupal" demonstrates a very simple single site capistrano deployment script that uses Drush Make.

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

3. Run the Capistrano setup task.

3.1 e.g. "cap staging deploy:setup"

4. Create your settings.php and place it in the /path/to/your.app/shared/default directory.

6. Point your apache configuration to the "current" directory under your application root. e.g: 

DocumentRoot /var/www/your.app/current"
<Directory "/var/www/your.app/current">

7. Run your deploy command (e.g. "cap staging deploy").
