@extends("template", ['itemsQty' => $itemsQty])

@section("content")
	<div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
        		@include("includes/message", ["type" => "danger"])
        		<form action="/login/store" method="POST" role="form">
        			{{ csrf_field() }}
        			<legend>Login</legend>
        			<div class="form-group">
        				<label for="">Email</label>
        				<input type="text" name="email" class="form-control" placeholder="Ex: kwalter@example.org">
        				{{ $errors->first('email') }}
        			</div>
        			<div class="form-group">
        				<label for="">Password</label>
        				<input type="password" name="password" class="form-control" placeholder="secret">
        				{{ $errors->first('password') }}
        			</div>

        			<button type="submit" class="btn btn-primary">Enter</button>
        		</form>
            </div>
        </div>
    </div>
@endsection