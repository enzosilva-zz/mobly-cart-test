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
    <br>
    <br>
	
	<div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
        		@include("includes/message", ["type" => "danger"])
        		<form action="/login/store" method="POST" role="form">
        			{{ csrf_field() }}
        			<legend>Login</legend>
        			<div class="form-group">
        				<label for="">Email</label>
        				<input type="text" name="email" class="form-control" placeholder="Ex: email@example.com.br">
        				{{ $errors->first('email') }}
        			</div>
        			<div class="form-group">
        				<label for="">Password</label>
        				<input type="password" name="password" class="form-control" placeholder="Password">
        				{{ $errors->first('password') }}
        			</div>

        			<button type="submit" class="btn btn-primary">Enter</button>
        		</form>
            </div>
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