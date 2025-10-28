mongosh
use admin

db.createUser({
  user: "admin",
  pwd: "strong_password",
  roles: ["root"]
})

exit
