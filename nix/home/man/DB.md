# MySQL

## Login

```
mysql -u {user} -D {database} -p {terminal}
```

## Show schema

```
show columns from {table}
```

# PostgreSQL

## Login

```
psql -h {host} -U {user} -d {database}
```

## Update

```
UPDATE {table} SET {column}={value} WHERE {column}={condition}
```

## Show schema

```
\d {table}
```

## Insert

```
INSERT INTO {table} (col_1_name, ..., col_n_name) VALUES ('{value_1}', ..., '{value_n}');
```

## Export CSV

```
psql -h {host} -U {user} -d {database} -c "\copy {table_name} to {file_path} DELIMITER ',' CSV HEADER"
```

## Import CSV

```
psql -h {host} -U {user} -d {database} -c "\copy {table_name} from {file_path} DELIMITER ',' CSV HEADER"
```

