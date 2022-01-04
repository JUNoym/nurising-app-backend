if Rails.env === 'production'
    Rails.application.config.session_store :cookie_store, key: '_auth-app-api', domain: 'https://nursing-app-frontend3.vercel.app'
else
    Rails.application.config.session_store :cookie_store, key: '_auth-app-api'
end