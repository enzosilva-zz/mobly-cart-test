@extends("template", ['itemsQty' => $itemsQty])

@section("content")
	<div class="container">
        <div class="row">
            <div class="col-sm-6 col-sm-offset-3">
        		<form action="/user/store" method="POST" role="form">
        			{{csrf_field()}}
        			<legend>Create an Account</legend>
        			<div class="form-group">
        				<label for="">Name</label>
        				<input type="text" name="name" class="form-control" placeholder="Ex: Kraig Walter">
        				{{ $errors->first('name') }}
        			</div>
        			<div class="form-group">
        				<label for="">Email</label>
        				<input type="text" name="email" class="form-control" placeholder="Ex: kwalter@example.org">
        				{{ $errors->first('email') }}
        			</div>
        			<div class="form-group">
        				<label for="">Password</label>
        				<input type="password" name="password" class="form-control" placeholder="Passowrd">
        				{{ $errors->first('password') }}
        			</div>

        			<button type="submit" class="btn btn-primary btn-block">Submit</button>
        		</form>
            </div>
        </div>
    </div>
@endsection