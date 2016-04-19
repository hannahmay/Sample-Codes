#!/bin/bash

dotenv () {
  set -a
  [ -f .env ] && . .env
  set +a
}

dotenv

echo "Resetting database.."
cat > temp.sql << EOF
DROP DATABASE IF EXISTS \`$DB_DATABASE\`;
CREATE DATABASE IF NOT EXISTS \`$DB_DATABASE\` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT USAGE ON *.* TO \`$DB_USERNAME\`@\`localhost\` IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`$DB_DATABASE\`.* TO \`$DB_USERNAME\`@\`localhost\`;
FLUSH PRIVILEGES;
EOF
mysql -u root -p"${DB_ROOT_PASSWORD}" -h localhost --port=$DB_ROOT_PORT < temp.sql
rm temp.sql
