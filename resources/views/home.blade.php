<!DOCTYPE html>
<html lang="en">
<head>
	<title>Mobly Cart Test</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>{{$title}}</h1>
		<ul>
		@foreach ($users as $user)
			<li>{{$user->name}}</li>
		@endforeach
		</ul>
	</div>
</body>
</html>