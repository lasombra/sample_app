# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
	user.name											"Ingo Hoffmann"
	user.email										"ihoffmann@exemplo.com.br"
	user.password 								"abc123de"
	user.password_confirmation  	"abc123de"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end