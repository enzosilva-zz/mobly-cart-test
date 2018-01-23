@if (session()->has("message"))
	<div class="row">
		<p class="alert alert-{{$type}}">{{ session()->get("message") }}</p>
	</div>
@endif