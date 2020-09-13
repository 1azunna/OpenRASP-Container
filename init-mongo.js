db.createUser(
    {
        user: "${MONGO_INITDB_USER}",
        pwd : "${MONGO_INITDB_PASSWORD}",
        roles : [
            {
                role : "readWrite",
                db: "${MONGO_INITDB_DATABASE}"
            }
        ]
    }
)