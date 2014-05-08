TestSpree::Application.routes.draw do

  get "robots.txt" => 'robots#index'

  # sitemap url
  match "/sitemap.xml" => redirect("https://s3.amazonaws.com/boombotix/sitemaps/sitemap_index.xml.gz"), via: [:get]

  # ----------------------------------------
  # error handling sitewide
  # ----------------------------------------

  # Are we handling an exception?
  class ExceptionAppConstraint
    def self.matches?(request)
      request.env["action_dispatch.exception"].present?
    end
  end

  # These routes are only considered when there is an exception
  constraints(ExceptionAppConstraint) do
    match "/404", :to => "errors#error_404", via: [:get]
    match "/500", :to => "errors#internal_server_error", via: [:get]

    # Any other status code
    match '*a', :to => "errors#unknown", via: [:get]
  end

  # ----------------------------------------
  # subdomains constraint for store.boombotix.com
  # ----------------------------------------
  constraints DomainConstraint.new(%w(
    spree.boombotix.com
    store.boombotix.com
    store.boombotix.dev
    store.boombotix-staging.com
    store.127.0.0.1.xip.io)) do

    # This line mounts Spree's routes at the root of your application.
    # This means, any requests to URLs such as /products, will go to Spree::ProductsController.
    # If you would like to change where this engine is mounted, simply change the :at option to something different.
    #
    # We ask that you don't use the :as option here, as Spree relies on it being the default of "spree"
    mount Spree::Core::Engine, :at => '/'
    # Spree::Core::Engine.routes.prepend do
    #   # Your new routes
    #   match "*id" => 'pages#show', :as => :page, :format => false
    # end

    Spree::Core::Engine.routes.append do
      # remove /t/ from taxon urls
      # usage => collections_url(@taxon)
      get "/*id", :to => 'taxons#show', :id => "collections"
    end

    # redirects (301) from shopify
    get '/about.php'                                           => redirect('http://www.boombotix.com/about')
    get '/warranty.php'                                        => redirect('http://www.boombotix.com/support')
    get '/contact.php'                                         => redirect('http://www.boombotix.com/contact')
    get '/team.php'                                            => redirect('http://www.boombotix.com/team')
    get '/investors.php'                                       => redirect('http://www.boombotix.com/investors')
    get '/techspecs.php'                                       => redirect('http://www.boombotix.com/tech_specs')
    get '/downloads.php'                                       => redirect('http://www.boombotix.com/media')
    get '/collections/bb2-speakers'                            => redirect('http://skullyboom.myshopify.com/collections/bb2-wireless-speakers')
    get '/collections/bb-limited-edition'                      => redirect('/collections/bb1-plus-limited-edition')
    get '/collections/reviews.php'                             => redirect('http://www.boombotix.com/reviews')
    get '/shipping.php'                                        => redirect('http://www.boombotix.com/contact')
    get '/collections/bb1-speakers/products/sb1-diy-white'     => redirect('/collections/bb1-speakers/products/bb1-diy-white')
    get '/collections/bb2-wireless-speakers/products/bb2-camo' => redirect('/collections/bb2-wireless-speakers/products/bb2-camouflage')
    get '/collections/bb1-speakers'                            => redirect('/collections/boombot1-speakers')
    get '/collections/bb2-wireless-speakers'                   => redirect('/collections/boombot2-wireless-speakers')
  end

  # ----------------------------------------
  # subdomains constraint for swagonomics.boombotix.com
  # ----------------------------------------
  constraints DomainConstraint.new(%w(
    swagonomics.boombotix.com
    swagonomics.boombotix.dev
    swagonomics.boombotix-staging.com
    swagonomics.127.0.0.1.xip.io)) do

    # root 'swagonomics.boombotix.com/'
    match '/' => 'posts#instagram_feed', via: [:get]

    # authentications
    resources :authentications

    # posts
    # resources :photos, :controller => "Posts", :as => "posts" do
    resources :posts, only: [:show, :create, :update, :destroy, :edit], path: '/photos' do
      collection do
        get  'instagram_feed', path: '/feed'
        get  'live_instagram_feed'
        post 'realtime_callback'
        get  'realtime_callback'
      end
      member do
        get  'tags_tooltip'
        get  'likes_tooltip'
      end
      resources :comments, only: [:create, :update, :destroy]
      resources :likes, only: [:index]
    end

    # comments
    resources :comments, only: [:create, :update, :destroy]

    # likes
    resources :likes, :only => [:create, :destroy]

    # devise for users
    # go to our custom controller(s)
    #devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
    #devise_scope :user do
      # delete '/users/logout' => 'devise/sessions#destroy'
    #end

    # users
    #resources :users, only: [:show, :edit, :update] do
    #  collection do
    #    get  'redeem'
    #  end
    #  post 'redeem'
    #  get  'redeem'
    #end

    # callback for omniauth (instagram/fb) authentication
    match '/auth/:provider/callback' => 'authentications#create', via: [:get, :post]
  end

  # ----------------------------------------
  # sync.boombotix.com
  # ----------------------------------------
  constraints DomainConstraint.new(%w(
    sync.boombotix.com
    sync.boombotix.dev
    sync.boombotix-staging.com
    sync.127.0.0.1.xip.io)) do

    match '/'      => 'high_voltage/pages#show', :via => [:get], :id => 'sync'
    match 'terms'  => 'high_voltage/pages#show', :via => [:get], :id => 'sync/terms'
  end

  # ----------------------------------------
  # top level domain, boombotix.com
  # ----------------------------------------
  constraints DomainConstraint.new(%w(
    www.boombotix.com
    boombotix.com
    boombotix.dev
    www.boombotix-staging.com
    boombotix-staging.com
    127.0.0.1.xip.io
    www.127.0.0.1.xip.io)) do

    # main boombotix.com root
    root :to => 'high_voltage/pages#show', :id => 'home'

    # active admin routes, devise routes for admin users
    #ActiveAdmin.routes(self)
    #devise_for :admin_users, ActiveAdmin::Devise.config

    # callback for omniauth (instagram/fb) authentication
    match '/auth/:provider/callback' => 'authentications#create', via: [:post, :get]

    # messages (contact us, zendesk)
    resources :messages, only: [:create]


    # locations (dealer locator)
    match '/dealer-locator'       => "locations#dealer_locator",  via: [:get], as: "dealer_locator"
    match '/dealers'              => redirect("/dealer-locator"), via: [:get]
    match '/store/dealers'        => redirect("/dealer-locator"), via: [:get]
    match '/store/dealer-locator' => redirect("/dealer-locator"), via: [:get]

    # redirect blog
    match "/skullyblog/(*all)" => redirect { |params, req| "http://blog.boombotix.com/#{params[:all]}" }, via: [:get]

    # 301s from .htaccess
    # media
    match "/downloads"   => redirect("/media/downloads"), via: [:get]
    match "/videos"      => redirect("/media/videos"),    via: [:get]
    match "/boomtube"    => redirect("/media/videos"),    via: [:get]
    match "/reviews"     => redirect("/media/reviews"),   via: [:get]

    # company
    match "/about-us"    => redirect("/company/about-us"), via: [:get]
    match "/partners"    => redirect("/company/partners"), via: [:get]
    match "/athletes"    => redirect("/company/athletes"), via: [:get]
    match "/team/(*all)" => redirect { |params, req| "http://boombotix.com/company/athletes/#{params[:all]}" }, via: [:get]

    # support
    match "/contact-us"  => redirect("/support/contact-us"), via: [:get]
    match "/contact"     => redirect("/support/contact-us"), via: [:get]
    match "/warranty"    => redirect("/support/warranty"),   via: [:get]
    match "/exchange"    => redirect("/support/exchange"),   via: [:get]
    match "/register"    => redirect("/support/register"),   via: [:get]
    match "/shipping"    => redirect("/support/shipping"),   via: [:get]
    match "/faq"         => redirect("/support/faq"),        via: [:get]
    match "/swagonomics" => redirect("http://swagonomics.boombotix.com"), via: [:get]

    # special 301s
    match "/rex"         => redirect("http://kickstarter.com/projects/boombotix/boombot-rex-ultraportable-speaker"), via: [:get]
    match "/90"          => redirect("http://store.boombotix.com"), via: [:get]

    # high voltage static pages
    get "*id" => 'high_voltage/pages#show', :as => :page, :format => false
  end

end
