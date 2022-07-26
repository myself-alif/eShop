# eshop
A laravel react ecommerce app


<h1>Installation</h1>

<ul>
<li>cd to eshop-frontend</li>
<li>write the command "npm install"</li>
<li>cd eshop-backend</li>
<li>write the command "npm install"</li>
<li>write the command "composer install"<li>
<li>rename .env.example to .env</li>
<li>in the .env file set DB_DATABASE=eshop_db</li>
<li>in the .env file paste the following code without brackets, This code enables google sign in
(GOOGLE_CLIENT_ID=333635469102-pkc3qftm09oq1jl02s0anskn2halsnie.apps.googleusercontent.com
GOOGLE_CLIENT_SECRET=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
GOOGLE_REDIRECT_URL=http://localhost:3000/googleSignInRedirect)
</li>
<li>run php artisan serve</li>
<li>visit http://127.0.0.1:8000/ and click on the generate app key button</li>
<li>instead of running "php artisan migrate"
<ul>
<li>open xampp</li>
<li>create a db called "eshop_db"</li>
<li>import the databse i've added in this repository (this db has products sample & categories which will be shown in the frontend)</li>
</ul>
</li>
<li>make sure laravel,react & xampp running/li>
<li>visit http://localhost:3000/</li>
</ul>
