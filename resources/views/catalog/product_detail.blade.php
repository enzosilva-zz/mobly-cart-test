@extends("template", ['itemsQty' => $itemsQty])

@section("content")
	<div class="row">
		<div class="col-sm-5">
			<div class="panel panel-default">
				<div class="panel-body">
					<img src="https://lorempixel.com/640/480/?54872" class="img-responsive" style="width:100%" alt="Image">
				</div>
			</div>
		</div>
		<div class="col-sm-7">
			<form action="/checkout/item/store" method="post">
			{{csrf_field()}}
			<input type="hidden" name="product_id" value="{{$product->id}}">
	        <input type="hidden" name="name" value="{{$product->name}}">
	        <input type="hidden" name="price" value="{{$product->price}}">
			<div class="row">
				<div class="panel panel-default">
	                <div class="panel-heading">
	                	<h4>{{$product->name}}</h4>
	                </div>
	            	<div class="panel-body">
	            		<p>{{$product->description}}</p>
						<ul class="list-group">
							<li class="list-group-item"><strong>Price: </strong>R${{$product->price}}</li>
							<li class="list-group-item">
								<strong>Category(ies): </strong>
								@foreach ($product->category as $key => $category)
		                            {{$category->name}}{{(count($product->category) != ($key + 1)) ? ", " : ""}}
		                        @endforeach
							</li>
							<li class="list-group-item">
								<strong>Characteristic(s): </strong>
								@foreach ($product->characteristic as $key => $characteristic)
		                            <ul><strong>{{$characteristic->name}}</strong>
		                            	<li>{{$characteristic->characteristicValue[0]->value}}</li>
		                            </ul>
		                        @endforeach
							</li>
						</ul>
					</div>
					<div class="panel-footer">
						<input type="number" name="item_qty" style="width: 75px;">
                    	<button type="submit" class="btn btn-primary">Buy</button>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
@endsection