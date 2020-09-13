db.createUser(
    {
        user : "openrasp",
        pwd : "${MONGO_INITDB_PASSWORD}",
        roles : [
            {
                role : "readWrite",
                db: "${MONGO_INITDB_DATABASE}"
            }
        ]
    }
)