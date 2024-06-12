# Script that initializes the PostgreSQL database with the necessary tables and data.
# Database file name is : db.sql
# user: "pepe",
# host: "localhost",
# database: "pepepizza"
# password: "pepe"

# First, start PostgreSQL server
echo "Starting PostgreSQL server..."
sudo service postgresql start

# Then, create user pepe with password pepe
echo "Creating user pepe..."
sudo -u postgres createuser -s pepe
if [ $? -ne 0 ]; then
    echo "Error creating user pepe"
    exit 1
fi

# Import the database file
echo "Importing database file..."
sudo -u postgres psql -f updb.sql
if [ $? -ne 0 ]; then
    echo "Error importing database file"
    exit 1
fi

# Finished
echo "Finished!"