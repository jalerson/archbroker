# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w( bootstrap/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( marker.css )

Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( jquery-ui.js )
Rails.application.config.assets.precompile += %w( jquery-1.11.1.min.js )
Rails.application.config.assets.precompile += %w( jquery.fs.zoetrope.min.js )
Rails.application.config.assets.precompile += %w( toe.min.js )
Rails.application.config.assets.precompile += %w( imgViewer.min.js )
Rails.application.config.assets.precompile += %w( jquery.mousewheel.min.js )
Rails.application.config.assets.precompile += %w( imgNotes.js )