@extends("template", ['itemsQty' => $itemsQty])
    
@section("content")
    <div class="row">
        <div class="col-sm-7">
            <div class="container">
                <div class="col-sm-7">
        	       @include("includes/message", ["type" => "success"])
                </div>
            </div>
            <form action="/checkout/item/update" id="form-update-cart" method="post">
            {{csrf_field()}}
            <div class="row">
                <div class="col-sm-4">
                    <legend>Item Name</legend>
                </div>
                <div class="col-sm-3">
                    <legend>Item Quantity</legend>
                </div>
                <div class="col-sm-3">
                    <legend>Item Price</legend>
                </div>
                <div class="col-sm-2">
                    <legend>Actions</legend>
                </div>
            </div>
            @foreach($cartItems as $item)
            <div class="row items">
                <div class="col-sm-4">
                    <p>{{$item->name}}</p>
                </div>
                <div class="col-sm-3">
                    <p><input type="number" id="item-qty[{{$item->product_id}}]" data-id="{{$item->product_id}}" name="items[{{$item->product_id}}][item_qty]" value="{{$item->item_qty}}" ></p>
                </div>
                <div class="col-sm-3">
                    <input type="hidden" id="item-price[{{$item->product_id}}]" data-id="{{$item->product_id}}" name="items[{{$item->product_id}}][item_price]" value="{{$item->product->price}}">
                    <p>R${{$item->price}}</p>
                </div>
                <div class="col-sm-2">
                    <a href="#">
                        <span class="glyphicon glyphicon-trash" data-id="{{$item->product_id}}" data-token="{{csrf_token()}}"></span>
                    </a>
                </div>
            </div>
            <hr>
            @endforeach
            <button type="submit" class="btn btn-primary" style="float: right;">Update Cart</button>
            </form> 
        </div>
        <div class="col-sm-3 col-sm-offset-1" style="background-color: #f2f2f2; padding-bottom: 10px;">
            <legend>Summary</legend>
            <br>
            <div class="row">
                <div class="col-sm-5">
                    <strong>Items Quantity</strong>
                </div>
                <div class="col-sm-7">
                    <span class="items-qty"></span>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-sm-5">
                    <strong>Total</strong>
                </div>
                <div class="col-sm-7">
                    <span class="total"></span>
                </div>
            </div>
            <br>
            <form action="/checkout/update" method="post">
                {{csrf_field()}}
                <input type="hidden" name="_method" value="put">
                <input type="hidden" name="active" value="0">
                <button type="submit" class="btn btn-primary btn-block">Checkout</button>
            </form>
        </div>
    </div>
@endsection