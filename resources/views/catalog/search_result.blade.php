@extends("template", ['itemsQty' => $itemsQty])
@section("content")
    @include("includes/message", ["type" => "success"])
    @foreach($results as $result)
    <form action="/checkout/item/store" method="post">
        {{csrf_field()}}
        <input type="hidden" name="product_id" value="{{$result->id}}">
        <input type="hidden" name="name" value="{{$result->name}}">
        <input type="hidden" name="price" value="{{$result->price}}">
        <div class="row">
            <div class="col-sm-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <a href="/catalog/product/{{$result->id}}/detail">{{$result->name}}</a> - <span class="price">R${{$result->price}}</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
	    	<div class="col-sm-3">
                <div class="panel-body">
                    <img src="{{$result->image}}" class="img-responsive" style="width:100%" alt="Image">
                </div>
            </div>
            <div class="col-sm-9">
                <div class="panel-body">
                    <p><strong>Description: </strong>{{$result->description}}</p>
                    <p><strong>Categories: </strong>
                        @foreach ($result->category as $key => $category)
                            {{$category->name}}{{(count($result->category) != ($key + 1)) ? ", " : ""}}
                        @endforeach
                    </p>
                    <p><strong>Characteristics: </strong>
                        @foreach ($result->characteristic as $key => $characteristic)
                            <ul><strong>{{$characteristic->name}}</strong>
                            @foreach ($characteristic->characteristicValue as $characteristicValue)
                                @foreach ($characteristicValue->productCharacteristicValue as $productCharacteristicValue)
                                    <li>{{$productCharacteristicValue->characteristicValue->value}}</li>
                                @endforeach
                            @endforeach
                            </ul>
                        @endforeach
                    </p>
                </div>
                <div class="panel-footer">
                    <input type="number" name="item_qty" style="width: 75px;">
                    <button type="submit" class="btn btn-primary">Buy</button>
                </div>
            </div>
        </div>
    </form>
    @endforeach
    <p>{{$results->appends(['q' => $q])->links()}}</p>
@endsection