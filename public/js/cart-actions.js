$(document).ready(function () {
    var elems = {
        rowItemsQty: $(document).find("input[id^='item-qty']"),
        rowItemsTotal: $(document).find("input[id^='item-price']"),
        rowItemsDelete: $(document).find(".glyphicon-trash"),
        spanItemsQty: $(document).find("span.items-qty"),
        spanTotal: $(document).find("span.total")
    };

    var init = function (elems) {
        elems.spanItemsQty.text(
            summaryActions.sumItemsQty(elems.rowItemsQty)
        );

        elems.spanTotal.text(
            "R$" + extra.number_format(summaryActions.sumItemsTotal(elems.rowItemsTotal), 2, ".", ",")
        );

        elems.rowItemsDelete.each(function () {
            $(this).on("click", function (e) {
                e.preventDefault();
                cartActions.delete($(this).data("id"), $(this).data("token"));
            });
        });
    };

    var extra = {
        number_format: function (number, decimalPlaces, subsSeparator, separator) {
            return parseFloat(number).toFixed(decimalPlaces).replace(subsSeparator, separator);
        }
    };

    var cartActions = {
        delete: function (itemId, token) {
            $.ajax({
                url: '/checkout/item/destroy',
                type: 'DELETE',
                data: {
                    "_token": token,
                    "item_id": itemId
                },
            })
            .done(function() {
                window.location.reload();
            })
            .fail(function(error) {
                console.log(error);
            });
            
        }
    };

    var summaryActions = {
        sumItemsQty: function (items) {
            var qty = 0;
            $(items).each(function () {
                qty += parseInt($(this).val());
            });

            return qty;
        },

        sumItemsTotal: function (items) {
            var price = 0;
            $(items).each(function () {
                var qty = $(document).find("input[id='item-qty["+ $(this).data('id') +"]']").val();
                price += (parseInt(qty) * parseFloat($(this).val()));
            });

            return price;
        }
    };

    return init(elems);
});