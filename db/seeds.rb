# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

root_user = User.create(email: 'hello@stetsonwiki.org', auth0_id: 'none')
home_page = Page.create(title: 'Home', body: 'Welcome to your new Stetson wiki!', creator: root_user)
StetsonConfig.create(site_name: 'My Wiki', home_page: home_page)