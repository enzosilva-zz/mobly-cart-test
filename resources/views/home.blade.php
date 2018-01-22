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

        .items-qty {
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
            <h1>Store Name</h1>
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
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Deals</a></li>
                    <li><a href="#">Stores</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    @if (Auth::check())
                    <li>
                        <a href="#" id="user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"><span class="glyphicon glyphicon-user"></span> {{auth()->user()->name}} <span class="caret"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="user-dropdown">
                            <li><a href="#">My Checkouts</a></li>
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
                        <a href="/checkout"><span class="glyphicon glyphicon-shopping-cart"></span> Cart
                        @if ($itemsQty)
                            <span class="items-qty">{{$itemsQty}}</span>
                        @endif
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container">
        @include("includes/message", ["type" => "success"])
        <div class="row">
            @foreach($products as $product)
            <form action="/checkout/store" method="post">
                {{csrf_field()}}
                <input type="hidden" name="product_id" value="{{$product->id}}">
                <input type="hidden" name="name" value="{{$product->name}}">
                <input type="hidden" name="price" value="{{$product->price}}">
                <div class="col-sm-3">
                    <div class="panel panel-default">
                        <div class="panel-heading">{{$product->name}}</div>
                        <div class="panel-body">
                            <img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
                        </div>
                        <div class="panel-footer">{{$product->description}}</div>
                        <div class="panel-footer">
                            <span class="price">R${{$product->price}}</span>
                        </div>
                        <div class="panel-footer">
                            <input type="number" name="item_qty" style="width: 75px;">
                            <button type="submit" class="btn btn-primary">Buy</button>
                        </div>
                    </div>
                </div>
            </form> 
            @endforeach
        </div>
    </div>
    <br>
    <br>

    <footer class="container-fluid text-center">
        <p>Store Name Copyright &copy;</p>
        <form class="form-inline">Get deals:
            <input type="email" class="form-control" size="50" placeholder="Email Address">
            <button type="button" class="btn btn-danger">Sign Up</button>
        </form>
    </footer>

</body>

</html>