@extends("template", ['itemsQty' => $itemsQty])

@section("content")
    @include("includes/message", ["type" => "success"])
    <div class="row">
        @foreach($products as $product)
        <form action="/checkout/item/store" method="post">
            {{csrf_field()}}
            <input type="hidden" name="product_id" value="{{$product->id}}">
            <input type="hidden" name="name" value="{{$product->name}}">
            <input type="hidden" name="price" value="{{$product->price}}">
            <div class="col-sm-3">
                <div class="panel panel-default">
                    <div class="panel-heading">{{$product->name}}</div>
                    <div class="panel-body">
                        <img src="{{$product->image}}" class="img-responsive" style="width:100%" alt="Image">
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
@endsection