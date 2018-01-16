<form action="catalog/products/store" method="post">
	{{csrf_field()}}

	<label for="name">Name</label>
	<input type="text" id="name" name="name">

	<label for="description">Description</label>
	<textarea name="description"></textarea>

	<input type="file" id="image" name="image">

	<label for="price">Price</label>
	<input type="text" id="price" name="price">

	<label for="category">Category</label>
	<select name="category" id="category" multiple="multiple">
		<option>Selecione</option>
		<option value="A">Categoria A</option>
		<option value="B">Categoria B</option>
		<option value="C">Categoria C</option>
	</select>

	<label for="characteristics-1">Characteristics</label>
	<input type="checkbox" id="characteristics-1" name="characteristics[]">
</form>