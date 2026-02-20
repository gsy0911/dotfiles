db-mysql:login ## mysql -u {user} -D {database} -p {terminal} ## login
db-mysql:sql ## show columns from {table} ## show schema
db-psql:login ## psql -h {host} -U {user} -d {database} ## login
db-psql:update ## UPDATE {table} SET {column}={value} WHERE {column}={condition} ## update table
db-psql:schema ## \d {table} ## show schema
db-psql:insert ## INSERT INTO {table} (col_1_name, ..., col_n_name) VALUES ('{value_1}', ..., '{value_n}'); ## insert data
db-psql:export-csv ## psql -h {host} -U {user} -d {database} -c "\copy {table_name} to {file_path} DELIMITER ',' CSV HEADER" ## insert data
db-psql:import-csv ## psql -h {host} -U {user} -d {database} -c "\copy {table_name} from {file_path} DELIMITER ',' CSV HEADER" ## insert data
# dbmysql/login
```
$ mysql -u {user} -D {database} -p {terminal}
```

# db/mysql/sql
# db/psql/login
# db/psql/sql


