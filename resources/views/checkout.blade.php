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
        /* Remove the navbar's default rounded borders and increase the bottom margin */
        .navbar {
            margin-bottom: 50px;
            border-radius: 0;
        }

        /* Remove the jumbotron's default bottom margin */
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

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: #f2f2f2;
            padding: 25px;
        }
    </style>
</head>

<body>
    <div class="jumbotron">
        <div class="container text-center">
            <h1>{{env("APP_NAME")}}</h1>
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
                        <a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart
                        @if ($itemsQty)
                            <span class="items-qty">{{$itemsQty}}</span>
                        @endif
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-7">
            	@include("includes/message", ["type" => "success"])
                <form action="/cart/store" method="post">
                {{csrf_field()}}
                <div class="row">
                    <div class="col-sm-6">
                        <legend>Item Name</legend>
                    </div>
                    <div class="col-sm-3">
                        <legend>Item Quantity</legend>
                    </div>
                    <div class="col-sm-3">
                        <legend>Item Price</legend>
                    </div>
                </div>
                @foreach($cartItems as $item)
                <div class="row">
                    <div class="col-sm-6">
                        <p>{{$item->name}}</p>
                    </div>
                    <div class="col-sm-3">
                        <p><input type="number" name="items[{{$item->product_id}}][item_qty]" value="{{$item->item_qty}}" ></p>
                    </div>
                    <div class="col-sm-3">
                        <input type="hidden" name="items[{{$item->product_id}}][item_price]" value="{{$item->product->price}}">
                        <p>R${{$item->price}}</p>
                    </div>
                </div>
                <hr>
                @endforeach
                <button type="submit" class="btn btn-primary" style="float: right;">Update Cart</button>
                </form> 
            </div>
            <div class="col-sm-3 col-sm-offset-1" style="background-color: #f2f2f2; padding-bottom: 10px;">
                <h3>Summary</h3>
                <button type="submit" class="btn btn-primary btn-block">Checkout</button>
            </div>
        </div>
    </div>
    <br>
    <br>

    <footer class="container-fluid text-center">
        <p>{{env("APP_NAME")}} Copyright &copy;</p>
        <form class="form-inline">Get deals:
            <input type="email" class="form-control" size="50" placeholder="Email Address">
            <button type="button" class="btn btn-danger">Sign Up</button>
        </form>
    </footer>

</body>

</html>