@extends("template", ['itemsQty' => $itemsQty])

@section("content")
	@if (!count($results))
		<div class="row">
            <div class="col-sm-12">
                <div class="alert alert-warning">
                	<p>You have not made any purchases!</p>
                </div>
            </div>
        </div>
	@endif
	@foreach($results as $result)
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    	<strong>Order ID: </strong>{{$result->id}} (<span>{{$result->created_at}})</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
	    	<div class="col-sm-9">
                <div class="panel-body">
                    <p><strong>Item List</strong></p>
                	<table class="table table-striped table-condensed">
                		<thead>
                			<tr>
                				<th>Name</th>
                				<th>Quantity</th>
                				<th>Price</th>
                			</tr>
                		</thead>
                		<tbody>
                			@foreach ($result->checkoutItem as $item)
                			<tr>
                				<td>{{$item->name}}</td>
                				<td>{{$item->item_qty}}</td>
                				<td>{{$item->price}}</td>
                			</tr>
                			@endforeach
                		</tbody>
                	</table>
                </div>
            </div>
            <div class="col-sm-3">
                <div class="panel-body">
                    <p><strong>Items Quantity: </strong>{{$result->items_qty}}</p>
                    <p><strong>Subtotal: </strong>{{$result->subtotal}}</p>
                    <p><strong>Total: </strong>{{$result->total}}</p>
                </div>
            </div>
        </div>
    @endforeach
    <p>{{$results->links()}}</p>
@endsection