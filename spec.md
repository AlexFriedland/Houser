[x] Include at least one has_many, at least one belongs_to, and at least one has_many :through relationship

• Include a many-to-many relationship with a model acting as a join table. That join table must include a user-submittable attribute — that is to say, some attribute other than its foreign keys that can be submitted by the app's user

payment -> rincome <- week

[x] Your models must include reasonable validations for the simple attributes. You don't need to add every possible validation or duplicates, such as presence and a minimum length, but the models should defend against invalid data.

user, house, etc

[] You must include at least one class level ActiveRecord scope method. a. Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (such as .where and .order) rather than native ruby methods (such as #find_all or #sort).

[x] Your application must provide standard user authentication, including signup, login, logout, and passwords.

did that

[x] Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

did that

[] You must include and make use of a nested resource with the appropriate RESTful URLs.

• You must include a nested new route with form that relates to the parent resource

• You must include a nested index or show route

[x] Your forms should correctly display validation errors. a. Your fields should be enclosed within a fields_with_errors class b. Error messages describing the validation failures must be present within the view.

[x] Your application must be, within reason, a DRY (Do-Not-Repeat-Yourself) rails app.

• Logic present in your controllers should be encapsulated as methods in your models.

• Your views should use helper methods and partials when appropriate.

• Follow patterns in the Rails Style Guide and the Ruby Style Guide.
