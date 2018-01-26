<!DOCTYPE html>
<html lang="en">

<head>
    <title>Store Name</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
        }

        .jumbotron {
            margin-bottom: 0;
        }

        .count-items {
            background: #D9534F;
            color: #ffffff;
            height: 20px;
            line-height: 20px;
            border-radius: 10px;
            padding: 0 8px;
            position: absolute;
            top: -5px;
            left: 70%;
            font-size: 12px;
            font-weight: bold;
        }

        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }
    </style>
</head>

<body>
    <div class="jumbotron">
        <div class="container text-center">
            <h1>{{env('APP_NAME')}}</h1>
            <p>Mission, Vision & Values</p>
        </div>
    </div>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="/">Home</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="#">Find Products: </a></li>
                    <form action="/catalog/show" method="get" style="float: right; margin-top: 10px;">
                        <li><input type="text" name="q"> <span class="glyphicon glyphicon-search"></span></li>
                    </form>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    @if (Auth::check())
                    <li>
                        <a href="#" id="user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-user"></span> {{auth()->user()->name}} <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="user-dropdown">
                            <li><a href="/checkout">My Checkouts</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/login/destroy">Logout</a></li>
                        </ul>
                    </li>
                    @else
                    <li>
                        <a href="#" id="guest-dropdown"data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">Welcome, guest! <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="guest-dropdown">
                            <li><a href="/login">Login</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/user/create">Create an Account</a></li>
                        </ul>
                    </li>
                    @endif
                    <li>
                        <a href="/checkout/item"><span class="glyphicon glyphicon-shopping-cart"></span> Cart
                        @if ($itemsQty)
                            <span class="count-items">{{$itemsQty}}</span>
                        @endif
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container-fluid">
        @yield("content")
    </div>
    <br>
    <br>

    <footer class="container-fluid text-center">
        <p>{{env('APP_NAME')}} Copyright &copy;</p>
        <form class="form-inline">Get deals:
            <input type="email" class="form-control" size="50" placeholder="Email Address">
            <button type="button" class="btn btn-danger">Sign Up</button>
        </form>
    </footer>

</body>
<script type="text/javascript" src="{{ URL::to('js/cart-actions.js') }}"></script>
</html>