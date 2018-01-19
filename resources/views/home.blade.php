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
            <h1>Store Name</h1>
            <p>Mission, Vision & Values</p>
        </div>
    </div>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Logo</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Products</a></li>
                    <li><a href="#">Deals</a></li>
                    <li><a href="#">Stores</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Your Account</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            @foreach($products as $product)
            <form action="/checkout/store" method="post">
                {{csrf_field()}}
                <input type="hidden" name="user_id" value="1">
                <input type="hidden" name="checkout_id" value="1">
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
                            <input type="number" name="item_qty" style="width: 76px;">
                            <button type="submit" class="btn btn-primary">Comprar</button>
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