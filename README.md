# Call Center 
The second part of the VOIP

# How to use this project 

1. Git clone `https://github.com/rishat5081/Voip_Call_Center.git` or download as zip.

2. Go to the folder Voip_Call_Center and open terminal

3. Write `npm i`

4. Create a database with `v_call_center`

5. Import the `.sql` file from `SQL/v_call_center.sql`

6. Go to the terminal write `npm start`

7. Open browser hit `localhost:22001`


# Important Things to be done before starting `NPM START`

# 1. Disable the `ONLY_FULL_GROUP_BY` follow this https://stackoverflow.com/a/36033983/10967697

2. When using `socket.io` the app.listen will be changed to `server.listen`

3. `Serialize` and `Deserialize` are only use once, like Normal `users` and `employee` it is uses only one `deserialize`.
