json.id @session.id
json.token @session.token
json.user do
  json.id @session.user.id
  json.email @session.user.email
  json.name @session.user.name
end
