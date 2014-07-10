# Imajindemo
Origional repository can be found: 
> https://github.com/souleiman/seesaw/tree/master/demo/imajindemo 

## Authors
> Ty Dang and TeamTwilightSparkle

## Running Locally

```sh
git clone git@github.com:TeamTwilightSparkle/imajindemo.git
cd imajindemo
npm install
npm start
```

~~~~~~~*~~~~~~~*~~~~~~~*~~~~~~~*
	To Set Up
~~~~~~~*~~~~~~~*~~~~~~~*~~~~~~~*
1. Make sure your database is set up
	a.	Look inside the sql folder to set up your database
	b.	If you do not have some sql software installed, mysql is recommended.
	c.	For those who are unfamiliar with SQL, open your mysql command line tool. After logging in, simply copy and paste the text from the .sql files to create the database.
		i.	Note that you should create the database first (db.sql), then tables (table.sql), finally populate (mock.sql)
2.	Make sure your server configurations are set up
	a.	Look in serversetup.js. Make sure everything is accurate. Usually the credentials are different per user, so make sure to change your passwords and stuff!
	b.	Note that javascript does not have an import command... so the serversetup.js is also copied into server.js. The settings should be identical
3.	Install nodejs if you do not have it already
4.	mysql module is included, however if not installed, do a 'npm install mysql' command from some command line interface
5.	If steps 1 and 2 are complete, then you should be ready to go!
	a.	to run server, type 'node server.js'
	b.	make sure you are in the correct directory...