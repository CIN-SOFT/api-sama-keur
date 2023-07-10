<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Activation de compte</title>

        <!-- Fonts -->
        <link rel="preconnect" href="https://fonts.bunny.net">
        <link href="https://fonts.bunny.net/css?family=figtree:400,600&display=swap" rel="stylesheet" />

        <!-- Styles -->
        <style>
           .container{
            box-sizing: border-box;
            max-width: 500px;
            background-color: #fff;
            box-shadow: 0 0 8px #f2f2f2;
            border-radius: 10px;
            margin: 20px auto;
            padding: 20px;
           }
           .active-btn{
            padding: 10px 20px;
            color: #fff;
            font-size: 20px;
            background: rgb(204, 147, 75);
            text-decoration: none;
            border-radius: 10px;
            margin: 20px auto;
           }
        </style>
    </head>
    <body class="container">
        <div class="content">
            <img src="{{ asset('images/logo.png') }}" alt="">
            <h2>Compte créé avec succès</h2>
            <p>Bonjour <b>{{$user->first_name}} {{$user->last_name}} </b>, nous sommes heureux de vous accueillir parmi les membres de notre plateforme <b>SAMA KEUR</b> </p>

            <p>Pou publier des produits merci d'activer votre compte en cliquant sur ce lien</p>
            <a class="active-btn" href="http://sama-keur.com">Activer votre compte</a>
        </div>
        
    </body>
</html>
