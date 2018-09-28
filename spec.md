# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
      User has_many portfolios, Portfolio has_many funds

- [x] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
      Portfolio belongs_to User, Fund belongs_to Portfolio

- [x] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
      User has_many Funds through Portfolio

- [x] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
      Portfolio.strategy, Portfolio.name

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
      User Validations: uniqueness and presence of email and username
      Portfolio Validations: uniqueness of name, presence of strategy and name
      Fund Validations: uniqueness of symbol, numericality of quantity and cost

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
      investments/popular_investments

- [x] Include signup (how e.g. Devise)
      UsersController contains a Signup form that creates a user at new_user_path

- [x] Include logout (how e.g. Devise)
      SessionsController contains login and logout methods that will create and destory sessions at:
      get '/signin' => 'sessions#new'
      post '/signin' => 'sessions#create'
      get '/signout' => 'sessions#destroy'

- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
      OmniAuth Google signup/login

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      users/1/funds

- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
      users/1/funds/new

- [x] Include form display of validation errors (form URL e.g. /recipes/new)
      Validation errors displayed for forms.

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
