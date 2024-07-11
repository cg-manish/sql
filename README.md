

### Start the mssql docker container



### create docker volume
```bash
docker volume create mssql_data

```

### run with volume
```

docker run -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Ktmlabs@2020' \
-p 1433:1433 --name sql_server \
-v mssql_data:/var/opt/mssql \
-d mcr.microsoft.com/mssql/server:latest
```

```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=password" \
   -p 1433:1433 --name sql-server --hostname sql-server \
   -d \
   mcr.microsoft.com/mssql/server:2022-latest
```
   User is car_reviews_account or sa/SA



#### Change sql server user and password
```sql
CREATE LOGIN car_reviews_account WITH PASSWORD = 'Ktmlabs@2020';
ALTER SERVER ROLE sysadmin ADD MEMBER car_reviews_account;
ALTER LOGIN sa DISABLE;
```
